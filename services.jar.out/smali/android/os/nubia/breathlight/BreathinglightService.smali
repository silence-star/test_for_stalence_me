.class public Landroid/os/nubia/breathlight/BreathinglightService;
.super Landroid/os/nubia/breathlight/IBreathinglightService$Stub;
.source "BreathinglightService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/os/nubia/breathlight/BreathinglightService$newCallContentObserver;,
        Landroid/os/nubia/breathlight/BreathinglightService$newMmsContentObserver;,
        Landroid/os/nubia/breathlight/BreathinglightService$SettingsObserver;
    }
.end annotation


# static fields
.field private static final BREATHINGLIGHT_ALWAYSE_ON:I = 0x1

.field private static final BREATHINGLIGHT_CHARGING_ON:I = 0x3

.field private static final BREATHINGLIGHT_FADE_IN_ONCE:I = 0x5

.field private static final BREATHINGLIGHT_FADE_OUT_ONCE:I = 0x6

.field private static final BREATHINGLIGHT_HOMEKEY_UP_ONCE:I = 0x7

.field private static final BREATHINGLIGHT_LOW_POWER_ON:I = 0x2

.field private static final BREATHINGLIGHT_MISSING_EVENT_ON:I = 0x4

.field private static final BREATHINGLIGHT_OFF:I = 0x0

.field private static final BREATHLIGHT_CHARGED:I = 0x4

.field private static final BREATHLIGHT_CHARGING:I = 0x2

.field private static final BREATHLIGHT_DEFAULT:I = 0x0

.field private static final BREATHLIGHT_LOW_POWER:I = 0x1

.field private static final BREATHLIGHT_MISS_EVENT:I = 0x8

.field private static final BREATHLIGHT_MISS_NOTIFICATION:I = 0x10

.field private static final DEBUG:Z = false

.field private static final KEYGUARD_NOTIFICATION_ACTION:Ljava/lang/String; = "cn.nubia.notifications.tips"

.field private static final MSG_NOTIFICATION_COMING:I = 0x0

.field private static final MSG_NOTIFICATION_DELETE:I = 0x1

.field private static final STEP_OF_LEVEL:I = 0x2

.field private static final TAG:Ljava/lang/String; = "BreathinglightService"


# instance fields
.field private final CALLER_URI:Landroid/net/Uri;

.field private final MMS_URI:Landroid/net/Uri;

.field private final SMS_URI:Landroid/net/Uri;

.field private mAverageValue:F

.field private mBatteryStatus:I

.field private mBreathLightFlag:I

.field private mBreathLightLevels:[F

.field private final mContext:Landroid/content/Context;

.field private final mHandler:Landroid/os/Handler;

.field private mLastAutoChangeTime:J

.field private mLightSensor:Landroid/hardware/Sensor;

.field private mLightSensorEventListener:Landroid/hardware/SensorEventListener;

.field private mMissCall:Z

.field private mMissMsg:Z

.field private mNotificationsPkg:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mScreenOnOffReceiver:Landroid/content/BroadcastReceiver;

.field private mSensorManager:Landroid/hardware/SensorManager;

.field private mSettingsObserver:Landroid/os/nubia/breathlight/BreathinglightService$SettingsObserver;

.field private mSwitchStatus:I

.field private oldCall:I

.field private oldMmsSMS:I

.field pm:Landroid/os/PowerManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    invoke-direct {p0}, Landroid/os/nubia/breathlight/IBreathinglightService$Stub;-><init>()V

    iput v1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->oldMmsSMS:I

    iput v1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->oldCall:I

    iput v1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    iput-boolean v1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mMissCall:Z

    iput-boolean v1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mMissMsg:Z

    const-string v0, "content://sms"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->SMS_URI:Landroid/net/Uri;

    const-string v0, "content://mms"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->MMS_URI:Landroid/net/Uri;

    const-string v0, "content://call_log/calls"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    iput-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->CALLER_URI:Landroid/net/Uri;

    const/4 v0, 0x4

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightLevels:[F

    iput v1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mNotificationsPkg:Ljava/util/ArrayList;

    new-instance v0, Landroid/os/nubia/breathlight/BreathinglightService$2;

    invoke-direct {v0, p0}, Landroid/os/nubia/breathlight/BreathinglightService$2;-><init>(Landroid/os/nubia/breathlight/BreathinglightService;)V

    iput-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mHandler:Landroid/os/Handler;

    new-instance v0, Landroid/os/nubia/breathlight/BreathinglightService$4;

    invoke-direct {v0, p0}, Landroid/os/nubia/breathlight/BreathinglightService$4;-><init>(Landroid/os/nubia/breathlight/BreathinglightService;)V

    iput-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mLightSensorEventListener:Landroid/hardware/SensorEventListener;

    new-instance v0, Landroid/os/nubia/breathlight/BreathinglightService$5;

    invoke-direct {v0, p0}, Landroid/os/nubia/breathlight/BreathinglightService$5;-><init>(Landroid/os/nubia/breathlight/BreathinglightService;)V

    iput-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mScreenOnOffReceiver:Landroid/content/BroadcastReceiver;

    iput-object p1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mContext:Landroid/content/Context;

    const-string v0, "power"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    iput-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->pm:Landroid/os/PowerManager;

    new-instance v0, Landroid/os/nubia/breathlight/BreathinglightService$SettingsObserver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Landroid/os/nubia/breathlight/BreathinglightService$SettingsObserver;-><init>(Landroid/os/nubia/breathlight/BreathinglightService;Landroid/os/Handler;)V

    iput-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSettingsObserver:Landroid/os/nubia/breathlight/BreathinglightService$SettingsObserver;

    iget-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSettingsObserver:Landroid/os/nubia/breathlight/BreathinglightService$SettingsObserver;

    invoke-virtual {v0}, Landroid/os/nubia/breathlight/BreathinglightService$SettingsObserver;->registerObserver()V

    invoke-direct {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->registerUnreadReceiver()V

    invoke-direct {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->batteryConnectionReceiver()V

    iget-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mContext:Landroid/content/Context;

    const-string v1, "sensor"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSensorManager:Landroid/hardware/SensorManager;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mLightSensor:Landroid/hardware/Sensor;

    invoke-direct {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->initBreathLightLevel()V

    invoke-direct {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->screenOffReceiver()V

    return-void

    nop

    :array_0
    .array-data 0x4
        0x0t 0x0t 0xf0t 0x41t
        0x0t 0x0t 0xb4t 0x42t
        0x0t 0x0t 0x20t 0x43t
        0x0t 0x0t 0x7at 0x43t
    .end array-data
.end method

.method static synthetic access$000(Landroid/os/nubia/breathlight/BreathinglightService;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$100(Landroid/os/nubia/breathlight/BreathinglightService;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->updateSwitchStatus()V

    return-void
.end method

.method static synthetic access$1000(Landroid/os/nubia/breathlight/BreathinglightService;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Landroid/os/nubia/breathlight/BreathinglightService;->handleNotificationDel(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1100(Landroid/os/nubia/breathlight/BreathinglightService;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$1200(Landroid/os/nubia/breathlight/BreathinglightService;)F
    .locals 1
    .parameter "x0"

    .prologue
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mAverageValue:F

    return v0
.end method

.method static synthetic access$1202(Landroid/os/nubia/breathlight/BreathinglightService;F)F
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput p1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mAverageValue:F

    return p1
.end method

.method static synthetic access$1300(Landroid/os/nubia/breathlight/BreathinglightService;)J
    .locals 2
    .parameter "x0"

    .prologue
    iget-wide v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mLastAutoChangeTime:J

    return-wide v0
.end method

.method static synthetic access$1302(Landroid/os/nubia/breathlight/BreathinglightService;J)J
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-wide p1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mLastAutoChangeTime:J

    return-wide p1
.end method

.method static synthetic access$1400(Landroid/os/nubia/breathlight/BreathinglightService;F)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Landroid/os/nubia/breathlight/BreathinglightService;->getBreathLightLevel(F)I

    move-result v0

    return v0
.end method

.method static synthetic access$200(Landroid/os/nubia/breathlight/BreathinglightService;)I
    .locals 1
    .parameter "x0"

    .prologue
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->oldMmsSMS:I

    return v0
.end method

.method static synthetic access$202(Landroid/os/nubia/breathlight/BreathinglightService;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput p1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->oldMmsSMS:I

    return p1
.end method

.method static synthetic access$302(Landroid/os/nubia/breathlight/BreathinglightService;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-boolean p1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mMissMsg:Z

    return p1
.end method

.method static synthetic access$400(Landroid/os/nubia/breathlight/BreathinglightService;Landroid/content/Context;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Landroid/os/nubia/breathlight/BreathinglightService;->updateMissEvent(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$500(Landroid/os/nubia/breathlight/BreathinglightService;)I
    .locals 1
    .parameter "x0"

    .prologue
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->oldCall:I

    return v0
.end method

.method static synthetic access$502(Landroid/os/nubia/breathlight/BreathinglightService;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput p1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->oldCall:I

    return p1
.end method

.method static synthetic access$602(Landroid/os/nubia/breathlight/BreathinglightService;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-boolean p1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mMissCall:Z

    return p1
.end method

.method static synthetic access$772(Landroid/os/nubia/breathlight/BreathinglightService;I)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBatteryStatus:I

    and-int/2addr v0, p1

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBatteryStatus:I

    return v0
.end method

.method static synthetic access$776(Landroid/os/nubia/breathlight/BreathinglightService;I)I
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBatteryStatus:I

    or-int/2addr v0, p1

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBatteryStatus:I

    return v0
.end method

.method static synthetic access$800(Landroid/os/nubia/breathlight/BreathinglightService;IZ)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    invoke-direct {p0, p1, p2}, Landroid/os/nubia/breathlight/BreathinglightService;->setBreathLightFlag(IZ)V

    return-void
.end method

.method static synthetic access$900(Landroid/os/nubia/breathlight/BreathinglightService;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Landroid/os/nubia/breathlight/BreathinglightService;->handleNotificationAdd(Ljava/lang/String;)V

    return-void
.end method

.method private batteryConnectionReceiver()V
    .locals 3

    .prologue
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mContext:Landroid/content/Context;

    new-instance v2, Landroid/os/nubia/breathlight/BreathinglightService$1;

    invoke-direct {v2, p0}, Landroid/os/nubia/breathlight/BreathinglightService$1;-><init>(Landroid/os/nubia/breathlight/BreathinglightService;)V

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method private doSetBrightness(I)V
    .locals 1
    .parameter "bcase"

    .prologue
    const/16 v0, 0x10

    invoke-virtual {p0, p1, v0}, Landroid/os/nubia/breathlight/BreathinglightService;->setBrightnessJNI(II)V

    return-void
.end method

.method private getBreathLightLevel(F)I
    .locals 2
    .parameter "value"

    .prologue
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightLevels:[F

    array-length v1, v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightLevels:[F

    aget v1, v1, v0

    cmpg-float v1, p1, v1

    if-gez v1, :cond_1

    :cond_0
    return v0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private handleNotificationAdd(Ljava/lang/String;)V
    .locals 5
    .parameter "newPkg"

    .prologue
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mNotificationsPkg:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    iget-object v2, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mNotificationsPkg:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .local v1, tempPkg:Ljava/lang/String;
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .end local v1           #tempPkg:Ljava/lang/String;
    :goto_1
    return-void

    .restart local v1       #tempPkg:Ljava/lang/String;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .end local v1           #tempPkg:Ljava/lang/String;
    :cond_1
    iget-object v2, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mNotificationsPkg:Ljava/util/ArrayList;

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/16 v2, 0x10

    const/4 v3, 0x1

    invoke-direct {p0, v2, v3}, Landroid/os/nubia/breathlight/BreathinglightService;->setBreathLightFlag(IZ)V

    const-string v2, "BreathinglightService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handleNotificationAdd size:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mNotificationsPkg:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private handleNotificationDel(Ljava/lang/String;)V
    .locals 5
    .parameter "newPkg"

    .prologue
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v2, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mNotificationsPkg:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    iget-object v2, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mNotificationsPkg:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .local v1, tempPkg:Ljava/lang/String;
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mNotificationsPkg:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .end local v1           #tempPkg:Ljava/lang/String;
    :goto_1
    return-void

    .restart local v1       #tempPkg:Ljava/lang/String;
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .end local v1           #tempPkg:Ljava/lang/String;
    :cond_1
    iget-object v2, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mNotificationsPkg:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-gtz v2, :cond_2

    const/16 v2, 0x10

    const/4 v3, 0x0

    invoke-direct {p0, v2, v3}, Landroid/os/nubia/breathlight/BreathinglightService;->setBreathLightFlag(IZ)V

    :cond_2
    const-string v2, "BreathinglightService"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handleNotificationDel size:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mNotificationsPkg:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method private initBreathLightLevel()V
    .locals 7

    .prologue
    const/4 v6, 0x1

    const/4 v0, 0x0

    .local v0, brightnessMode:I
    :try_start_0
    iget-object v3, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "led_light_brightness_mode"

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :goto_0
    if-ne v0, v6, :cond_0

    const-string v3, "BreathinglightService"

    const-string v4, "initBreathLightLevel auto mode"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, v6}, Landroid/os/nubia/breathlight/BreathinglightService;->setBreathLightAuto(Z)V

    :goto_1
    return-void

    :catch_0
    move-exception v1

    .local v1, e:Ljava/lang/Exception;
    const-string v3, "BreathinglightService"

    const-string v4, "initBreathLightLevel SettingNotFoundException"

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .end local v1           #e:Ljava/lang/Exception;
    :cond_0
    iget-object v3, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string v4, "led_light_brightness"

    const/4 v5, 0x2

    invoke-static {v3, v4, v5}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    .local v2, level:I
    const-string v3, "BreathinglightService"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "initBreathLightLevel level:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-direct {p0, v2}, Landroid/os/nubia/breathlight/BreathinglightService;->initMinGrade(I)V

    goto :goto_1
.end method

.method private initMinGrade(I)V
    .locals 2
    .parameter "level"

    .prologue
    add-int/lit8 v1, p1, 0x1

    mul-int/lit8 v0, v1, 0x2

    .local v0, min_grade:I
    invoke-virtual {p0, v0}, Landroid/os/nubia/breathlight/BreathinglightService;->setMinGrade(I)V

    return-void
.end method

.method private notificationReceiver()V
    .locals 3

    .prologue
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "cn.nubia.notifications.tips"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mContext:Landroid/content/Context;

    new-instance v2, Landroid/os/nubia/breathlight/BreathinglightService$3;

    invoke-direct {v2, p0}, Landroid/os/nubia/breathlight/BreathinglightService$3;-><init>(Landroid/os/nubia/breathlight/BreathinglightService;)V

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method private registerUnreadReceiver()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    iget-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->SMS_URI:Landroid/net/Uri;

    new-instance v2, Landroid/os/nubia/breathlight/BreathinglightService$newMmsContentObserver;

    iget-object v3, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mContext:Landroid/content/Context;

    invoke-direct {v2, p0, v3, v5}, Landroid/os/nubia/breathlight/BreathinglightService$newMmsContentObserver;-><init>(Landroid/os/nubia/breathlight/BreathinglightService;Landroid/content/Context;Landroid/os/Handler;)V

    invoke-virtual {v0, v1, v4, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    iget-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->MMS_URI:Landroid/net/Uri;

    new-instance v2, Landroid/os/nubia/breathlight/BreathinglightService$newMmsContentObserver;

    iget-object v3, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mContext:Landroid/content/Context;

    invoke-direct {v2, p0, v3, v5}, Landroid/os/nubia/breathlight/BreathinglightService$newMmsContentObserver;-><init>(Landroid/os/nubia/breathlight/BreathinglightService;Landroid/content/Context;Landroid/os/Handler;)V

    invoke-virtual {v0, v1, v4, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    iget-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->CALLER_URI:Landroid/net/Uri;

    new-instance v2, Landroid/os/nubia/breathlight/BreathinglightService$newCallContentObserver;

    iget-object v3, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mContext:Landroid/content/Context;

    invoke-direct {v2, p0, v3, v5}, Landroid/os/nubia/breathlight/BreathinglightService$newCallContentObserver;-><init>(Landroid/os/nubia/breathlight/BreathinglightService;Landroid/content/Context;Landroid/os/Handler;)V

    invoke-virtual {v0, v1, v4, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    return-void
.end method

.method private screenOffReceiver()V
    .locals 3

    .prologue
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mContext:Landroid/content/Context;

    iget-object v2, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mScreenOnOffReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method private setBreathLightFlag(IZ)V
    .locals 2
    .parameter "flag"
    .parameter "value"

    .prologue
    if-eqz p2, :cond_0

    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    or-int/2addr v0, p1

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    :goto_0
    invoke-direct {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->setLightStatus()V

    return-void

    :cond_0
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    xor-int/lit8 v1, p1, -0x1

    and-int/2addr v0, v1

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    goto :goto_0
.end method

.method private setLightStatus()V
    .locals 3

    .prologue
    const/4 v2, 0x4

    const/4 v1, 0x0

    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_0

    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_0

    invoke-virtual {p0, v2, v1}, Landroid/os/nubia/breathlight/BreathinglightService;->setBrightness2(IZ)V

    :goto_0
    return-void

    :cond_0
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_1

    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_1

    invoke-virtual {p0, v2, v1}, Landroid/os/nubia/breathlight/BreathinglightService;->setBrightness2(IZ)V

    goto :goto_0

    :cond_1
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_2

    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    invoke-virtual {p0, v0, v1}, Landroid/os/nubia/breathlight/BreathinglightService;->setBrightness2(IZ)V

    goto :goto_0

    :cond_2
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_3

    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_3

    const/4 v0, 0x3

    invoke-virtual {p0, v0, v1}, Landroid/os/nubia/breathlight/BreathinglightService;->setBrightness2(IZ)V

    goto :goto_0

    :cond_3
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_4

    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_4

    const/4 v0, 0x2

    invoke-virtual {p0, v0, v1}, Landroid/os/nubia/breathlight/BreathinglightService;->setBrightness2(IZ)V

    goto :goto_0

    :cond_4
    invoke-virtual {p0, v1, v1}, Landroid/os/nubia/breathlight/BreathinglightService;->setBrightness2(IZ)V

    goto :goto_0
.end method

.method private updateBreathLightFlag()V
    .locals 1

    .prologue
    invoke-virtual {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->hasMissEvent()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    :goto_0
    invoke-virtual {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->hasMissNotification()Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    :goto_1
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBatteryStatus:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_2

    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    :goto_2
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBatteryStatus:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_3

    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    :goto_3
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBatteryStatus:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_4

    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    :goto_4
    return-void

    :cond_0
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    goto :goto_0

    :cond_1
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    goto :goto_1

    :cond_2
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    and-int/lit8 v0, v0, -0x5

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    goto :goto_2

    :cond_3
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    goto :goto_3

    :cond_4
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBreathLightFlag:I

    goto :goto_4
.end method

.method private updateMissEvent(Landroid/content/Context;)V
    .locals 2
    .parameter "ctx"

    .prologue
    const/16 v1, 0x8

    iget-boolean v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mMissCall:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mMissMsg:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v1, v0}, Landroid/os/nubia/breathlight/BreathinglightService;->setBreathLightFlag(IZ)V

    :goto_0
    return-void

    :cond_1
    const/4 v0, 0x0

    invoke-direct {p0, v1, v0}, Landroid/os/nubia/breathlight/BreathinglightService;->setBreathLightFlag(IZ)V

    goto :goto_0
.end method

.method private updateSwitchStatus()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    iget-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "led_light_event_miss"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    :goto_0
    iget-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "led_light_app_msg"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    :goto_1
    iget-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "led_light_charge"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_2

    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    :goto_2
    iget-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "led_light_battery_low"

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_3

    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    :goto_3
    return-void

    :cond_0
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    goto :goto_0

    :cond_1
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    and-int/lit8 v0, v0, -0x11

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    goto :goto_1

    :cond_2
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    and-int/lit8 v0, v0, -0x3

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    goto :goto_2

    :cond_3
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    and-int/lit8 v0, v0, -0x2

    iput v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    goto :goto_3
.end method


# virtual methods
.method public clearUnreadEvent()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mMissMsg:Z

    iput-boolean v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mMissCall:Z

    iget-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mNotificationsPkg:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const-string v0, "BreathinglightService"

    const-string v1, "clearUnreadEvent"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public enterScreenOffState()V
    .locals 0

    .prologue
    invoke-direct {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->updateBreathLightFlag()V

    invoke-direct {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->setLightStatus()V

    return-void
.end method

.method public getBatteryStatus()I
    .locals 1

    .prologue
    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mBatteryStatus:I

    return v0
.end method

.method public getBrightness()I
    .locals 1

    .prologue
    invoke-virtual {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->getBrightnessJNI()I

    move-result v0

    .local v0, tmp:I
    return v0
.end method

.method native getBrightnessJNI()I
.end method

.method public getMinGrade()I
    .locals 1

    .prologue
    invoke-virtual {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->getMinGradeJNI()I

    move-result v0

    return v0
.end method

.method native getMinGradeJNI()I
.end method

.method public getMissedCallerNum()I
    .locals 10

    .prologue
    const/4 v2, 0x0

    const/4 v7, 0x0

    .local v7, count:I
    iget-object v1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .local v0, cr:Landroid/content/ContentResolver;
    if-nez v0, :cond_0

    move v8, v7

    .end local v7           #count:I
    .local v8, count:I
    :goto_0
    return v8

    .end local v8           #count:I
    .restart local v7       #count:I
    :cond_0
    const-string v3, "type = 3 and new = 1 and INCOMING_CALL_TIME > 0"

    .local v3, selection:Ljava/lang/String;
    sget-object v1, Landroid/provider/CallLog$Calls;->CONTENT_URI:Landroid/net/Uri;

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .local v6, callerCursor:Landroid/database/Cursor;
    if-eqz v6, :cond_1

    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    :goto_1
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_1
    move v8, v7

    .end local v7           #count:I
    .restart local v8       #count:I
    goto :goto_0

    .end local v8           #count:I
    .restart local v7       #count:I
    :catch_0
    move-exception v9

    .local v9, e:Ljava/lang/Exception;
    :try_start_1
    invoke-virtual {v9}, Ljava/lang/Exception;->printStackTrace()V

    const-string v1, "BreathinglightService"

    const-string v2, "getMissedCallerNum fail"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .end local v9           #e:Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v1
.end method

.method public getSwitchStatus()I
    .locals 1

    .prologue
    invoke-direct {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->updateSwitchStatus()V

    iget v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSwitchStatus:I

    return v0
.end method

.method public getUnreadMmsNum()I
    .locals 14

    .prologue
    const/4 v2, 0x0

    const/4 v12, 0x0

    .local v12, smsCount:I
    const/4 v10, 0x0

    .local v10, mmsCount:I
    iget-object v1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .local v0, cr:Landroid/content/ContentResolver;
    if-nez v0, :cond_0

    move v1, v12

    :goto_0
    return v1

    :cond_0
    const-string v3, "read=0"

    .local v3, selection:Ljava/lang/String;
    iget-object v1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->SMS_URI:Landroid/net/Uri;

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .local v13, smsCursor:Landroid/database/Cursor;
    if-eqz v13, :cond_1

    :try_start_0
    invoke-interface {v13}, Landroid/database/Cursor;->getCount()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v12

    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    :cond_1
    const-string v7, "read=0 and (m_type=130 or m_type=132) and (thread_id is not null and thread_id in (select _id from threads))"

    .local v7, mmSelection:Ljava/lang/String;
    iget-object v5, p0, Landroid/os/nubia/breathlight/BreathinglightService;->MMS_URI:Landroid/net/Uri;

    move-object v4, v0

    move-object v6, v2

    move-object v8, v2

    move-object v9, v2

    invoke-virtual/range {v4 .. v9}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v11

    .local v11, mmsCursor:Landroid/database/Cursor;
    if-eqz v11, :cond_2

    :try_start_1
    invoke-interface {v11}, Landroid/database/Cursor;->getCount()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-result v10

    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    :cond_2
    add-int v1, v12, v10

    goto :goto_0

    .end local v7           #mmSelection:Ljava/lang/String;
    .end local v11           #mmsCursor:Landroid/database/Cursor;
    :catchall_0
    move-exception v1

    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    throw v1

    .restart local v7       #mmSelection:Ljava/lang/String;
    .restart local v11       #mmsCursor:Landroid/database/Cursor;
    :catchall_1
    move-exception v1

    invoke-interface {v11}, Landroid/database/Cursor;->close()V

    throw v1
.end method

.method public handleNotification(Ljava/lang/String;Z)V
    .locals 0
    .parameter "pkg"
    .parameter "flag"

    .prologue
    if-eqz p2, :cond_0

    invoke-direct {p0, p1}, Landroid/os/nubia/breathlight/BreathinglightService;->handleNotificationDel(Ljava/lang/String;)V

    :goto_0
    return-void

    :cond_0
    invoke-direct {p0, p1}, Landroid/os/nubia/breathlight/BreathinglightService;->handleNotificationAdd(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public hasMissEvent()Z
    .locals 3

    .prologue
    const-string v0, "BreathinglightService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "hasMissEvent mMissMsg:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mMissMsg:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " mMissCall:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mMissCall:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mMissMsg:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mMissCall:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hasMissNotification()Z
    .locals 3

    .prologue
    const-string v0, "BreathinglightService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "hasMissNotification size:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mNotificationsPkg:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mNotificationsPkg:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setBreathLightAuto(Z)V
    .locals 4
    .parameter "flag"

    .prologue
    if-eqz p1, :cond_0

    iget-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mLightSensorEventListener:Landroid/hardware/SensorEventListener;

    iget-object v2, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mLightSensor:Landroid/hardware/Sensor;

    const/4 v3, 0x3

    invoke-virtual {v0, v1, v2, v3}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mSensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Landroid/os/nubia/breathlight/BreathinglightService;->mLightSensorEventListener:Landroid/hardware/SensorEventListener;

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    goto :goto_0
.end method

.method public setBreathLightLevel(I)V
    .locals 5
    .parameter "level"

    .prologue
    const/16 v4, 0x38

    mul-int/lit8 v1, p1, 0x2

    add-int/lit8 v0, v1, 0xa

    .local v0, min_grade:I
    const-string v1, "BreathinglightService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setBreathLightLevel level:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " min_grade:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->getMinGrade()I

    move-result v1

    if-eq v1, v0, :cond_0

    invoke-virtual {p0, v0}, Landroid/os/nubia/breathlight/BreathinglightService;->setMinGrade(I)V

    const/16 v1, 0x8

    invoke-virtual {p0, v1, v4}, Landroid/os/nubia/breathlight/BreathinglightService;->setKeycodeBrightness(II)V

    const/4 v1, 0x1

    invoke-virtual {p0, v1, v4}, Landroid/os/nubia/breathlight/BreathinglightService;->setKeycodeBrightness(II)V

    :cond_0
    return-void
.end method

.method public setBrightness(I)V
    .locals 2
    .parameter "value"

    .prologue
    invoke-virtual {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->getBrightness()I

    move-result v0

    if-ne v0, p1, :cond_0

    invoke-virtual {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->getBrightness()I

    move-result v0

    const/4 v1, 0x7

    if-ne v0, v1, :cond_1

    :cond_0
    invoke-direct {p0, p1}, Landroid/os/nubia/breathlight/BreathinglightService;->doSetBrightness(I)V

    :cond_1
    return-void
.end method

.method public setBrightness2(IZ)V
    .locals 1
    .parameter "value"
    .parameter "isKeyEvent"

    .prologue
    invoke-virtual {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->getBrightness()I

    move-result v0

    if-ne v0, p1, :cond_1

    if-eqz p1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-eqz p2, :cond_2

    invoke-virtual {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->getBrightness()I

    move-result v0

    if-eq v0, p1, :cond_0

    invoke-direct {p0, p1}, Landroid/os/nubia/breathlight/BreathinglightService;->doSetBrightness(I)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->pm:Landroid/os/PowerManager;

    invoke-virtual {v0}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Landroid/os/nubia/breathlight/BreathinglightService;->doSetBrightness(I)V

    goto :goto_0
.end method

.method native setBrightnessJNI(II)V
.end method

.method public setKeycodeBrightness(II)V
    .locals 4
    .parameter "value"
    .parameter "outn"

    .prologue
    const/4 v3, 0x6

    const/4 v2, 0x5

    const/4 v1, 0x7

    iget-object v0, p0, Landroid/os/nubia/breathlight/BreathinglightService;->pm:Landroid/os/PowerManager;

    invoke-virtual {v0}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v0

    if-nez v0, :cond_2

    if-eq p1, v2, :cond_0

    if-eq p1, v3, :cond_0

    if-eq p1, v1, :cond_0

    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    :cond_0
    const-string v0, "BreathinglightService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "error status setKeycodeBrightness  value = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " outn = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_0
    return-void

    :cond_2
    invoke-virtual {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->getBrightness()I

    move-result v0

    if-eq v0, v2, :cond_3

    invoke-virtual {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->getBrightness()I

    move-result v0

    if-ne v0, v3, :cond_4

    :cond_3
    if-eq p1, v1, :cond_1

    :cond_4
    invoke-virtual {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->getBrightness()I

    move-result v0

    if-ne v0, p1, :cond_5

    invoke-virtual {p0}, Landroid/os/nubia/breathlight/BreathinglightService;->getBrightness()I

    move-result v0

    if-ne v0, v1, :cond_1

    :cond_5
    invoke-virtual {p0, p1, p2}, Landroid/os/nubia/breathlight/BreathinglightService;->setBrightnessJNI(II)V

    goto :goto_0
.end method

.method public setMinGrade(I)V
    .locals 0
    .parameter "value"

    .prologue
    invoke-virtual {p0, p1}, Landroid/os/nubia/breathlight/BreathinglightService;->setMinGradeJNI(I)V

    return-void
.end method

.method native setMinGradeJNI(I)V
.end method
