.class public Lcom/android/server/Watchdog;
.super Ljava/lang/Thread;
.source "Watchdog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/Watchdog$Monitor;,
        Lcom/android/server/Watchdog$RebootRequestReceiver;,
        Lcom/android/server/Watchdog$HandlerChecker;
    }
.end annotation


# static fields
.field static final CHECK_INTERVAL:J = 0x7530L

.field static final COMPLETED:I = 0x0

.field static final DB:Z = false

.field static final DEFAULT_TIMEOUT:J = 0xea60L

.field public static final NATIVE_STACKS_OF_INTEREST:[Ljava/lang/String; = null

.field static final OVERDUE:I = 0x3

.field static final RECORD_KERNEL_THREADS:Z = true

.field static final TAG:Ljava/lang/String; = "Watchdog"

.field static final WAITED_HALF:I = 0x2

.field static final WAITING:I = 0x1

.field static final localLOGV:Z

.field static sWatchdog:Lcom/android/server/Watchdog;


# instance fields
.field mActivity:Lcom/android/server/am/ActivityManagerService;

.field mActivityControllerPid:I

.field mAlarm:Lcom/android/server/AlarmManagerService;

.field mAllowRestart:Z

.field mBattery:Lcom/android/server/BatteryService;

.field mController:Landroid/app/IActivityController;

.field final mHandlerCheckers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/Watchdog$HandlerChecker;",
            ">;"
        }
    .end annotation
.end field

.field final mMonitorChecker:Lcom/android/server/Watchdog$HandlerChecker;

.field mPhonePid:I

.field mPower:Lcom/android/server/power/PowerManagerService;

.field mResolver:Landroid/content/ContentResolver;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "/system/bin/mediaserver"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "/system/bin/sdcard"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "/system/bin/surfaceflinger"

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/server/Watchdog;->NATIVE_STACKS_OF_INTEREST:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 7

    .prologue
    const-wide/32 v4, 0xea60

    const-string v0, "watchdog"

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/server/Watchdog;->mHandlerCheckers:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/server/Watchdog;->mAllowRestart:Z

    new-instance v0, Lcom/android/server/Watchdog$HandlerChecker;

    invoke-static {}, Lcom/android/server/FgThread;->getHandler()Landroid/os/Handler;

    move-result-object v2

    const-string v3, "foreground thread"

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/server/Watchdog$HandlerChecker;-><init>(Lcom/android/server/Watchdog;Landroid/os/Handler;Ljava/lang/String;J)V

    iput-object v0, p0, Lcom/android/server/Watchdog;->mMonitorChecker:Lcom/android/server/Watchdog$HandlerChecker;

    iget-object v0, p0, Lcom/android/server/Watchdog;->mHandlerCheckers:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/android/server/Watchdog;->mMonitorChecker:Lcom/android/server/Watchdog$HandlerChecker;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v6, p0, Lcom/android/server/Watchdog;->mHandlerCheckers:Ljava/util/ArrayList;

    new-instance v0, Lcom/android/server/Watchdog$HandlerChecker;

    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v2, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    const-string v3, "main thread"

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/server/Watchdog$HandlerChecker;-><init>(Lcom/android/server/Watchdog;Landroid/os/Handler;Ljava/lang/String;J)V

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v6, p0, Lcom/android/server/Watchdog;->mHandlerCheckers:Ljava/util/ArrayList;

    new-instance v0, Lcom/android/server/Watchdog$HandlerChecker;

    invoke-static {}, Lcom/android/server/UiThread;->getHandler()Landroid/os/Handler;

    move-result-object v2

    const-string v3, "ui thread"

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/server/Watchdog$HandlerChecker;-><init>(Lcom/android/server/Watchdog;Landroid/os/Handler;Ljava/lang/String;J)V

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v6, p0, Lcom/android/server/Watchdog;->mHandlerCheckers:Ljava/util/ArrayList;

    new-instance v0, Lcom/android/server/Watchdog$HandlerChecker;

    invoke-static {}, Lcom/android/server/IoThread;->getHandler()Landroid/os/Handler;

    move-result-object v2

    const-string v3, "i/o thread"

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/server/Watchdog$HandlerChecker;-><init>(Lcom/android/server/Watchdog;Landroid/os/Handler;Ljava/lang/String;J)V

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private describeCheckersLocked(Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/Watchdog$HandlerChecker;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .local p1, checkers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/Watchdog$HandlerChecker;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v2, 0x80

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .local v0, builder:Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_0

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/server/Watchdog$HandlerChecker;

    invoke-virtual {v2}, Lcom/android/server/Watchdog$HandlerChecker;->describeBlockedStateLocked()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private dumpKernelStackTraces()Ljava/io/File;
    .locals 3

    .prologue
    const/4 v1, 0x0

    const-string v2, "dalvik.vm.stack-trace-file"

    invoke-static {v2, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, tracesPath:Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    :goto_0
    return-object v1

    :cond_1
    invoke-direct {p0, v0}, Lcom/android/server/Watchdog;->native_dumpKernelStacks(Ljava/lang/String;)V

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private evaluateCheckerCompletionLocked()I
    .locals 4

    .prologue
    const/4 v2, 0x0

    .local v2, state:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    iget-object v3, p0, Lcom/android/server/Watchdog;->mHandlerCheckers:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_0

    iget-object v3, p0, Lcom/android/server/Watchdog;->mHandlerCheckers:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/server/Watchdog$HandlerChecker;

    .local v0, hc:Lcom/android/server/Watchdog$HandlerChecker;
    invoke-virtual {v0}, Lcom/android/server/Watchdog$HandlerChecker;->getCompletionStateLocked()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .end local v0           #hc:Lcom/android/server/Watchdog$HandlerChecker;
    :cond_0
    return v2
.end method

.method private getBlockedCheckersLocked()Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/server/Watchdog$HandlerChecker;",
            ">;"
        }
    .end annotation

    .prologue
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .local v0, checkers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/Watchdog$HandlerChecker;>;"
    const/4 v2, 0x0

    .local v2, i:I
    :goto_0
    iget-object v3, p0, Lcom/android/server/Watchdog;->mHandlerCheckers:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    iget-object v3, p0, Lcom/android/server/Watchdog;->mHandlerCheckers:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/server/Watchdog$HandlerChecker;

    .local v1, hc:Lcom/android/server/Watchdog$HandlerChecker;
    invoke-virtual {v1}, Lcom/android/server/Watchdog$HandlerChecker;->isOverdueLocked()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v1           #hc:Lcom/android/server/Watchdog$HandlerChecker;
    :cond_1
    return-object v0
.end method

.method public static getInstance()Lcom/android/server/Watchdog;
    .locals 1

    .prologue
    sget-object v0, Lcom/android/server/Watchdog;->sWatchdog:Lcom/android/server/Watchdog;

    if-nez v0, :cond_0

    new-instance v0, Lcom/android/server/Watchdog;

    invoke-direct {v0}, Lcom/android/server/Watchdog;-><init>()V

    sput-object v0, Lcom/android/server/Watchdog;->sWatchdog:Lcom/android/server/Watchdog;

    :cond_0
    sget-object v0, Lcom/android/server/Watchdog;->sWatchdog:Lcom/android/server/Watchdog;

    return-object v0
.end method

.method private native native_dumpKernelStacks(Ljava/lang/String;)V
.end method


# virtual methods
.method public addMonitor(Lcom/android/server/Watchdog$Monitor;)V
    .locals 2
    .parameter "monitor"

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Monitors can\'t be added once the Watchdog is running"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/android/server/Watchdog;->mMonitorChecker:Lcom/android/server/Watchdog$HandlerChecker;

    invoke-virtual {v0, p1}, Lcom/android/server/Watchdog$HandlerChecker;->addMonitor(Lcom/android/server/Watchdog$Monitor;)V

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void
.end method

.method public addThread(Landroid/os/Handler;Ljava/lang/String;)V
    .locals 2
    .parameter "thread"
    .parameter "name"

    .prologue
    const-wide/32 v0, 0xea60

    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/android/server/Watchdog;->addThread(Landroid/os/Handler;Ljava/lang/String;J)V

    return-void
.end method

.method public addThread(Landroid/os/Handler;Ljava/lang/String;J)V
    .locals 7
    .parameter "thread"
    .parameter "name"
    .parameter "timeoutMillis"

    .prologue
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Threads can\'t be added once the Watchdog is running"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_0
    :try_start_1
    iget-object v6, p0, Lcom/android/server/Watchdog;->mHandlerCheckers:Ljava/util/ArrayList;

    new-instance v0, Lcom/android/server/Watchdog$HandlerChecker;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-wide v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/android/server/Watchdog$HandlerChecker;-><init>(Lcom/android/server/Watchdog;Landroid/os/Handler;Ljava/lang/String;J)V

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-void
.end method

.method public init(Landroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/power/PowerManagerService;Lcom/android/server/AlarmManagerService;Lcom/android/server/am/ActivityManagerService;)V
    .locals 4
    .parameter "context"
    .parameter "battery"
    .parameter "power"
    .parameter "alarm"
    .parameter "activity"

    .prologue
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/Watchdog;->mResolver:Landroid/content/ContentResolver;

    iput-object p2, p0, Lcom/android/server/Watchdog;->mBattery:Lcom/android/server/BatteryService;

    iput-object p3, p0, Lcom/android/server/Watchdog;->mPower:Lcom/android/server/power/PowerManagerService;

    iput-object p4, p0, Lcom/android/server/Watchdog;->mAlarm:Lcom/android/server/AlarmManagerService;

    iput-object p5, p0, Lcom/android/server/Watchdog;->mActivity:Lcom/android/server/am/ActivityManagerService;

    new-instance v0, Lcom/android/server/Watchdog$RebootRequestReceiver;

    invoke-direct {v0, p0}, Lcom/android/server/Watchdog$RebootRequestReceiver;-><init>(Lcom/android/server/Watchdog;)V

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.REBOOT"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v2, "android.permission.REBOOT"

    const/4 v3, 0x0

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    return-void
.end method

.method public processStarted(Ljava/lang/String;I)V
    .locals 1
    .parameter "name"
    .parameter "pid"

    .prologue
    monitor-enter p0

    :try_start_0
    const-string v0, "com.android.phone"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iput p2, p0, Lcom/android/server/Watchdog;->mPhonePid:I

    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :cond_1
    const-string v0, "ActivityController"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iput p2, p0, Lcom/android/server/Watchdog;->mActivityControllerPid:I

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method rebootSystem(Ljava/lang/String;)V
    .locals 5
    .parameter "reason"

    .prologue
    const/4 v4, 0x0

    const-string v1, "Watchdog"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Rebooting system because: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "power"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v0

    check-cast v0, Lcom/android/server/power/PowerManagerService;

    .local v0, pms:Lcom/android/server/power/PowerManagerService;
    invoke-virtual {v0, v4, p1, v4}, Lcom/android/server/power/PowerManagerService;->reboot(ZLjava/lang/String;Z)V

    return-void
.end method

.method public run()V
    .locals 37

    .prologue
    const/16 v32, 0x0

    .local v32, waitedHalf:Z
    :goto_0
    monitor-enter p0

    const-wide/16 v27, 0x7530

    .local v27, timeout:J
    const/4 v13, 0x0

    .local v13, i:I
    :goto_1
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/Watchdog;->mHandlerCheckers:Ljava/util/ArrayList;

    move-object/from16 v33, v0

    invoke-virtual/range {v33 .. v33}, Ljava/util/ArrayList;->size()I

    move-result v33

    move/from16 v0, v33

    if-ge v13, v0, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/server/Watchdog;->mHandlerCheckers:Ljava/util/ArrayList;

    move-object/from16 v33, v0

    move-object/from16 v0, v33

    invoke-virtual {v0, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/android/server/Watchdog$HandlerChecker;

    .local v12, hc:Lcom/android/server/Watchdog$HandlerChecker;
    invoke-virtual {v12}, Lcom/android/server/Watchdog$HandlerChecker;->scheduleCheckLocked()V

    add-int/lit8 v13, v13, 0x1

    goto :goto_1

    .end local v12           #hc:Lcom/android/server/Watchdog$HandlerChecker;
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v23

    .local v23, start:J
    :goto_2
    const-wide/16 v33, 0x0

    cmp-long v33, v27, v33

    if-lez v33, :cond_1

    :try_start_1
    move-object/from16 v0, p0

    move-wide/from16 v1, v27

    invoke-virtual {v0, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    :goto_3
    const-wide/16 v33, 0x7530

    :try_start_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v35

    sub-long v35, v35, v23

    sub-long v27, v33, v35

    goto :goto_2

    :catch_0
    move-exception v10

    .local v10, e:Ljava/lang/InterruptedException;
    const-string v33, "Watchdog"

    move-object/from16 v0, v33

    invoke-static {v0, v10}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_3

    .end local v10           #e:Ljava/lang/InterruptedException;
    .end local v23           #start:J
    :catchall_0
    move-exception v33

    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v33

    .restart local v23       #start:J
    :cond_1
    :try_start_3
    invoke-direct/range {p0 .. p0}, Lcom/android/server/Watchdog;->evaluateCheckerCompletionLocked()I

    move-result v31

    .local v31, waitState:I
    if-nez v31, :cond_2

    const/16 v32, 0x0

    monitor-exit p0

    goto :goto_0

    :cond_2
    const/16 v33, 0x1

    move/from16 v0, v31

    move/from16 v1, v33

    if-ne v0, v1, :cond_3

    monitor-exit p0

    goto :goto_0

    :cond_3
    const/16 v33, 0x2

    move/from16 v0, v31

    move/from16 v1, v33

    if-ne v0, v1, :cond_5

    if-nez v32, :cond_4

    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .local v19, pids:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v33

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    move-object/from16 v0, v19

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/16 v33, 0x1

    const/16 v34, 0x0

    const/16 v35, 0x0

    sget-object v36, Lcom/android/server/Watchdog;->NATIVE_STACKS_OF_INTEREST:[Ljava/lang/String;

    move/from16 v0, v33

    move-object/from16 v1, v19

    move-object/from16 v2, v34

    move-object/from16 v3, v35

    move-object/from16 v4, v36

    invoke-static {v0, v1, v2, v3, v4}, Lcom/android/server/am/ActivityManagerService;->dumpStackTraces(ZLjava/util/ArrayList;Lcom/android/internal/os/ProcessCpuTracker;Landroid/util/SparseArray;[Ljava/lang/String;)Ljava/io/File;

    const/16 v32, 0x1

    .end local v19           #pids:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_4
    monitor-exit p0

    goto/16 :goto_0

    :cond_5
    invoke-direct/range {p0 .. p0}, Lcom/android/server/Watchdog;->getBlockedCheckersLocked()Ljava/util/ArrayList;

    move-result-object v7

    .local v7, blockedCheckers:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/server/Watchdog$HandlerChecker;>;"
    move-object/from16 v0, p0

    invoke-direct {v0, v7}, Lcom/android/server/Watchdog;->describeCheckersLocked(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v25

    .local v25, subject:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-boolean v5, v0, Lcom/android/server/Watchdog;->mAllowRestart:Z

    .local v5, allowRestart:Z
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const/16 v33, 0xaf2

    move/from16 v0, v33

    move-object/from16 v1, v25

    invoke-static {v0, v1}, Landroid/util/EventLog;->writeEvent(ILjava/lang/String;)I

    new-instance v19, Ljava/util/ArrayList;

    invoke-direct/range {v19 .. v19}, Ljava/util/ArrayList;-><init>()V

    .restart local v19       #pids:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v33

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    move-object/from16 v0, v19

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/Watchdog;->mPhonePid:I

    move/from16 v33, v0

    if-lez v33, :cond_6

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/Watchdog;->mPhonePid:I

    move/from16 v33, v0

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    move-object/from16 v0, v19

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_6
    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/Watchdog;->mActivityControllerPid:I

    move/from16 v33, v0

    if-lez v33, :cond_7

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/server/Watchdog;->mActivityControllerPid:I

    move/from16 v33, v0

    invoke-static/range {v33 .. v33}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v33

    move-object/from16 v0, v19

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_7
    if-nez v32, :cond_9

    const/16 v33, 0x1

    :goto_4
    const/16 v34, 0x0

    const/16 v35, 0x0

    sget-object v36, Lcom/android/server/Watchdog;->NATIVE_STACKS_OF_INTEREST:[Ljava/lang/String;

    move/from16 v0, v33

    move-object/from16 v1, v19

    move-object/from16 v2, v34

    move-object/from16 v3, v35

    move-object/from16 v4, v36

    invoke-static {v0, v1, v2, v3, v4}, Lcom/android/server/am/ActivityManagerService;->dumpStackTraces(ZLjava/util/ArrayList;Lcom/android/internal/os/ProcessCpuTracker;Landroid/util/SparseArray;[Ljava/lang/String;)Ljava/io/File;

    move-result-object v21

    .local v21, stack:Ljava/io/File;
    const-wide/16 v33, 0x7d0

    invoke-static/range {v33 .. v34}, Landroid/os/SystemClock;->sleep(J)V

    invoke-direct/range {p0 .. p0}, Lcom/android/server/Watchdog;->dumpKernelStackTraces()Ljava/io/File;

    :try_start_4
    new-instance v26, Ljava/io/FileWriter;

    const-string v33, "/proc/sysrq-trigger"

    move-object/from16 v0, v26

    move-object/from16 v1, v33

    invoke-direct {v0, v1}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V

    .local v26, sysrq_trigger:Ljava/io/FileWriter;
    const-string v33, "w"

    move-object/from16 v0, v26

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    invoke-virtual/range {v26 .. v26}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .end local v26           #sysrq_trigger:Ljava/io/FileWriter;
    :goto_5
    const-string v33, "dalvik.vm.stack-trace-file"

    const/16 v34, 0x0

    invoke-static/range {v33 .. v34}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    .local v30, tracesPath:Ljava/lang/String;
    if-eqz v30, :cond_8

    invoke-virtual/range {v30 .. v30}, Ljava/lang/String;->length()I

    move-result v33

    if-eqz v33, :cond_8

    new-instance v29, Ljava/io/File;

    invoke-direct/range {v29 .. v30}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v29, traceRenameFile:Ljava/io/File;
    const-string v33, "."

    move-object/from16 v0, v30

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v16

    .local v16, lpos:I
    const/16 v33, -0x1

    move/from16 v0, v33

    move/from16 v1, v16

    if-eq v0, v1, :cond_a

    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v34, 0x0

    move-object/from16 v0, v30

    move/from16 v1, v34

    move/from16 v2, v16

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, "_SystemServer_WDT"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    move-object/from16 v0, v30

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v34

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .local v18, newTracesPath:Ljava/lang/String;
    :goto_6
    new-instance v33, Ljava/io/File;

    move-object/from16 v0, v33

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v29

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-object/from16 v30, v18

    .end local v16           #lpos:I
    .end local v18           #newTracesPath:Ljava/lang/String;
    .end local v29           #traceRenameFile:Ljava/io/File;
    :cond_8
    new-instance v17, Ljava/io/File;

    move-object/from16 v0, v17

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v17, newFd:Ljava/io/File;
    new-instance v9, Lcom/android/server/Watchdog$1;

    const-string v33, "watchdogWriteToDropbox"

    move-object/from16 v0, p0

    move-object/from16 v1, v33

    move-object/from16 v2, v25

    move-object/from16 v3, v17

    invoke-direct {v9, v0, v1, v2, v3}, Lcom/android/server/Watchdog$1;-><init>(Lcom/android/server/Watchdog;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)V

    .local v9, dropboxThread:Ljava/lang/Thread;
    invoke-virtual {v9}, Ljava/lang/Thread;->start()V

    const-wide/16 v33, 0x7d0

    :try_start_5
    move-wide/from16 v0, v33

    invoke-virtual {v9, v0, v1}, Ljava/lang/Thread;->join(J)V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_3

    :goto_7
    monitor-enter p0

    :try_start_6
    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/server/Watchdog;->mController:Landroid/app/IActivityController;

    .local v8, controller:Landroid/app/IActivityController;
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    if-eqz v8, :cond_b

    const-string v33, "Watchdog"

    const-string v34, "Reporting stuck state to activity controller"

    invoke-static/range {v33 .. v34}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_7
    const-string v33, "Service dumps disabled due to hung system process."

    invoke-static/range {v33 .. v33}, Landroid/os/Binder;->setDumpDisabled(Ljava/lang/String;)V

    move-object/from16 v0, v25

    invoke-interface {v8, v0}, Landroid/app/IActivityController;->systemNotResponding(Ljava/lang/String;)I

    move-result v20

    .local v20, res:I
    if-ltz v20, :cond_b

    const-string v33, "Watchdog"

    const-string v34, "Activity controller requested to coninue to wait"

    invoke-static/range {v33 .. v34}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_7} :catch_2

    const/16 v32, 0x0

    goto/16 :goto_0

    .end local v8           #controller:Landroid/app/IActivityController;
    .end local v9           #dropboxThread:Ljava/lang/Thread;
    .end local v17           #newFd:Ljava/io/File;
    .end local v20           #res:I
    .end local v21           #stack:Ljava/io/File;
    .end local v30           #tracesPath:Ljava/lang/String;
    :cond_9
    const/16 v33, 0x0

    goto/16 :goto_4

    .restart local v21       #stack:Ljava/io/File;
    :catch_1
    move-exception v10

    .local v10, e:Ljava/io/IOException;
    const-string v33, "Watchdog"

    const-string v34, "Failed to write to /proc/sysrq-trigger"

    invoke-static/range {v33 .. v34}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string v33, "Watchdog"

    invoke-virtual {v10}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_5

    .end local v10           #e:Ljava/io/IOException;
    .restart local v16       #lpos:I
    .restart local v29       #traceRenameFile:Ljava/io/File;
    .restart local v30       #tracesPath:Ljava/lang/String;
    :cond_a
    new-instance v33, Ljava/lang/StringBuilder;

    invoke-direct/range {v33 .. v33}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v33

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v34, "_SystemServer_WDT"

    invoke-virtual/range {v33 .. v34}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    .restart local v18       #newTracesPath:Ljava/lang/String;
    goto/16 :goto_6

    .end local v16           #lpos:I
    .end local v18           #newTracesPath:Ljava/lang/String;
    .end local v29           #traceRenameFile:Ljava/io/File;
    .restart local v9       #dropboxThread:Ljava/lang/Thread;
    .restart local v17       #newFd:Ljava/io/File;
    :catchall_1
    move-exception v33

    :try_start_8
    monitor-exit p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    throw v33

    .restart local v8       #controller:Landroid/app/IActivityController;
    :catch_2
    move-exception v33

    :cond_b
    invoke-static {}, Landroid/os/Debug;->isDebuggerConnected()Z

    move-result v33

    if-eqz v33, :cond_c

    const-string v33, "Watchdog"

    const-string v34, "Debugger connected: Watchdog is *not* killing the system process"

    invoke-static/range {v33 .. v34}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_8
    const/16 v32, 0x0

    goto/16 :goto_0

    :cond_c
    if-nez v5, :cond_d

    const-string v33, "Watchdog"

    const-string v34, "Restart not allowed: Watchdog is *not* killing the system process"

    invoke-static/range {v33 .. v34}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_8

    :cond_d
    const-string v33, "Watchdog"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "*** WATCHDOG KILLING SYSTEM PROCESS: "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v13, 0x0

    :goto_9
    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v33

    move/from16 v0, v33

    if-ge v13, v0, :cond_f

    const-string v34, "Watchdog"

    new-instance v35, Ljava/lang/StringBuilder;

    invoke-direct/range {v35 .. v35}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Lcom/android/server/Watchdog$HandlerChecker;

    invoke-virtual/range {v33 .. v33}, Lcom/android/server/Watchdog$HandlerChecker;->getName()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v35

    move-object/from16 v1, v33

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    const-string v35, " stack trace:"

    move-object/from16 v0, v33

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v33

    move-object/from16 v0, v34

    move-object/from16 v1, v33

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {v7, v13}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v33

    check-cast v33, Lcom/android/server/Watchdog$HandlerChecker;

    invoke-virtual/range {v33 .. v33}, Lcom/android/server/Watchdog$HandlerChecker;->getThread()Ljava/lang/Thread;

    move-result-object v33

    invoke-virtual/range {v33 .. v33}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v22

    .local v22, stackTrace:[Ljava/lang/StackTraceElement;
    move-object/from16 v6, v22

    .local v6, arr$:[Ljava/lang/StackTraceElement;
    array-length v15, v6

    .local v15, len$:I
    const/4 v14, 0x0

    .local v14, i$:I
    :goto_a
    if-ge v14, v15, :cond_e

    aget-object v11, v6, v14

    .local v11, element:Ljava/lang/StackTraceElement;
    const-string v33, "Watchdog"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "    at "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v14, v14, 0x1

    goto :goto_a

    .end local v11           #element:Ljava/lang/StackTraceElement;
    :cond_e
    add-int/lit8 v13, v13, 0x1

    goto :goto_9

    .end local v6           #arr$:[Ljava/lang/StackTraceElement;
    .end local v14           #i$:I
    .end local v15           #len$:I
    .end local v22           #stackTrace:[Ljava/lang/StackTraceElement;
    :cond_f
    const-string v33, "Watchdog"

    const-string v34, "*** GOODBYE!"

    invoke-static/range {v33 .. v34}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v33

    invoke-static/range {v33 .. v33}, Landroid/os/Process;->killProcess(I)V

    const/16 v33, 0xa

    invoke-static/range {v33 .. v33}, Ljava/lang/System;->exit(I)V

    goto/16 :goto_8

    .end local v8           #controller:Landroid/app/IActivityController;
    :catch_3
    move-exception v33

    goto/16 :goto_7
.end method

.method public setActivityController(Landroid/app/IActivityController;)V
    .locals 1
    .parameter "controller"

    .prologue
    monitor-enter p0

    :try_start_0
    iput-object p1, p0, Lcom/android/server/Watchdog;->mController:Landroid/app/IActivityController;

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public setAllowRestart(Z)V
    .locals 1
    .parameter "allowRestart"

    .prologue
    monitor-enter p0

    :try_start_0
    iput-boolean p1, p0, Lcom/android/server/Watchdog;->mAllowRestart:Z

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
