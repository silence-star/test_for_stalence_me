.class Lcom/android/server/ServerThread;
.super Ljava/lang/Object;
.source "SystemServer.java"


# static fields
.field private static final ENCRYPTED_STATE:Ljava/lang/String; = "1"

.field private static final ENCRYPTING_STATE:Ljava/lang/String; = "trigger_restart_min_framework"

.field public static final SMARTSHOW_MANAGER_SERVICE:Ljava/lang/String; = "com.powermo.smartshow.frameworks.SmartShowManagerService"

.field private static final TAG:Ljava/lang/String; = "SystemServer"


# instance fields
.field SmartShowManagerInit:Ljava/lang/reflect/Method;

.field SmartShowManagerService:Ljava/lang/Class;

.field mContentResolver:Landroid/content/ContentResolver;

.field mSmartShowManager:Ljava/lang/Object;


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/ServerThread;->SmartShowManagerService:Ljava/lang/Class;

    iput-object v0, p0, Lcom/android/server/ServerThread;->mSmartShowManager:Ljava/lang/Object;

    iput-object v0, p0, Lcom/android/server/ServerThread;->SmartShowManagerInit:Ljava/lang/reflect/Method;

    return-void
.end method

.method private static final deviceHasSufficientMemory()Z
    .locals 7

    .prologue
    const-wide/32 v0, 0x20000000

    .local v0, MEMORY_SIZE_MIN:J
    new-instance v2, Lcom/android/internal/util/MemInfoReader;

    invoke-direct {v2}, Lcom/android/internal/util/MemInfoReader;-><init>()V

    .local v2, minfo:Lcom/android/internal/util/MemInfoReader;
    invoke-virtual {v2}, Lcom/android/internal/util/MemInfoReader;->readMemInfo()V

    invoke-virtual {v2}, Lcom/android/internal/util/MemInfoReader;->getTotalSize()J

    move-result-wide v3

    const-wide/32 v5, 0x20000000

    cmp-long v3, v3, v5

    if-gtz v3, :cond_0

    const/4 v3, 0x0

    :goto_0
    return v3

    :cond_0
    const/4 v3, 0x1

    goto :goto_0
.end method

.method static final startSystemUi(Landroid/content/Context;)V
    .locals 4
    .parameter "context"

    .prologue
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .local v0, intent:Landroid/content/Intent;
    new-instance v1, Landroid/content/ComponentName;

    const-string v2, "com.android.systemui"

    const-string v3, "com.android.systemui.SystemUIService"

    invoke-direct {v1, v2, v3}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    sget-object v1, Landroid/os/UserHandle;->OWNER:Landroid/os/UserHandle;

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->startServiceAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/ComponentName;

    return-void
.end method


# virtual methods
.method public initAndLoop()V
    .locals 175

    .prologue
    const/16 v7, 0xbc2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    invoke-static {v7, v9, v10}, Landroid/util/EventLog;->writeEvent(IJ)I

    invoke-static {}, Landroid/os/Looper;->prepareMainLooper()V

    const/4 v7, -0x2

    invoke-static {v7}, Landroid/os/Process;->setThreadPriority(I)V

    const/4 v7, 0x1

    invoke-static {v7}, Lcom/android/internal/os/BinderInternal;->disableBackgroundScheduling(Z)V

    const/4 v7, 0x0

    invoke-static {v7}, Landroid/os/Process;->setCanSelfBackground(Z)V

    const-string v7, "sys.shutdown.requested"

    const-string v9, ""

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v149

    .local v149, shutdownAction:Ljava/lang/String;
    if-eqz v149, :cond_0

    invoke-virtual/range {v149 .. v149}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_0

    const/4 v7, 0x0

    move-object/from16 v0, v149

    invoke-virtual {v0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v9, 0x31

    if-ne v7, v9, :cond_26

    const/16 v143, 0x1

    .local v143, reboot:Z
    :goto_0
    invoke-virtual/range {v149 .. v149}, Ljava/lang/String;->length()I

    move-result v7

    const/4 v9, 0x1

    if-le v7, v9, :cond_27

    const/4 v7, 0x1

    invoke-virtual/range {v149 .. v149}, Ljava/lang/String;->length()I

    move-result v9

    move-object/from16 v0, v149

    invoke-virtual {v0, v7, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v142

    .local v142, reason:Ljava/lang/String;
    :goto_1
    move/from16 v0, v143

    move-object/from16 v1, v142

    invoke-static {v0, v1}, Lcom/android/server/power/ShutdownThread;->rebootOrShutdown(ZLjava/lang/String;)V

    .end local v142           #reason:Ljava/lang/String;
    .end local v143           #reboot:Z
    :cond_0
    const-string v7, "ro.factorytest"

    invoke-static {v7}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v107

    .local v107, factoryTestStr:Ljava/lang/String;
    const-string v7, ""

    move-object/from16 v0, v107

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_28

    const/16 v106, 0x0

    .local v106, factoryTest:I
    :goto_2
    const-string v7, "1"

    const-string v9, "ro.config.headless"

    const-string v10, "0"

    invoke-static {v9, v10}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    .local v33, headless:Z
    const/16 v114, 0x0

    .local v114, installer:Lcom/android/server/pm/Installer;
    const/16 v63, 0x0

    .local v63, accountManager:Lcom/android/server/accounts/AccountManagerService;
    const/16 v83, 0x0

    .local v83, contentService:Lcom/android/server/content/ContentService;
    const/16 v116, 0x0

    .local v116, lights:Lcom/android/server/LightsService;
    const/4 v4, 0x0

    .local v4, power:Lcom/android/server/power/PowerManagerService;
    const/16 v99, 0x0

    .local v99, display:Lcom/android/server/display/DisplayManagerService;
    const/16 v70, 0x0

    .local v70, battery:Lcom/android/server/BatteryService;
    const/16 v162, 0x0

    .local v162, vibrator:Lcom/android/server/VibratorService;
    const/16 v165, 0x0

    .local v165, wakeGesture:Lcom/android/server/WakeGestureService;
    const/16 v109, 0x0

    .local v109, haptics:Lcom/android/server/HapticsService;
    const/16 v65, 0x0

    .local v65, alarm:Lcom/android/server/AlarmManagerService;
    const/16 v124, 0x0

    .local v124, mountService:Lcom/android/server/MountService;
    const/16 v30, 0x0

    .local v30, networkManagement:Lcom/android/server/NetworkManagementService;
    const/16 v29, 0x0

    .local v29, networkStats:Lcom/android/server/net/NetworkStatsService;
    const/16 v128, 0x0

    .local v128, networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    const/16 v79, 0x0

    .local v79, connectivity:Lcom/android/server/ConnectivityService;
    const/16 v138, 0x0

    .local v138, qcCon:Ljava/lang/Object;
    const/16 v171, 0x0

    .local v171, wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    const/16 v169, 0x0

    .local v169, wifi:Lcom/android/server/wifi/WifiService;
    const/16 v148, 0x0

    .local v148, serviceDiscovery:Lcom/android/server/NsdService;
    const/16 v134, 0x0

    .local v134, pm:Landroid/content/pm/IPackageManager;
    const/4 v5, 0x0

    .local v5, context:Landroid/content/Context;
    const/16 v173, 0x0

    .local v173, wm:Lcom/android/server/wm/WindowManagerService;
    const/16 v71, 0x0

    .local v71, bluetooth:Lcom/android/server/BluetoothManagerService;
    const/16 v100, 0x0

    .local v100, dock:Lcom/android/server/DockObserver;
    const/16 v160, 0x0

    .local v160, usb:Lcom/android/server/usb/UsbService;
    const/16 v146, 0x0

    .local v146, serial:Lcom/android/server/SerialService;
    const/16 v156, 0x0

    .local v156, twilight:Lcom/android/server/TwilightService;
    const/16 v158, 0x0

    .local v158, uiMode:Lcom/android/server/UiModeManagerService;
    const/16 v144, 0x0

    .local v144, recognition:Lcom/android/server/RecognitionManagerService;
    const/16 v130, 0x0

    .local v130, networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    const/16 v76, 0x0

    .local v76, commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    const/16 v113, 0x0

    .local v113, inputManager:Lcom/android/server/input/InputManagerService;
    const/16 v73, 0x0

    .local v73, breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    const/16 v152, 0x0

    .local v152, telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    const/16 v126, 0x0

    .local v126, msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    const/16 v81, 0x0

    .local v81, consumerIr:Lcom/android/server/ConsumerIrService;
    new-instance v174, Landroid/os/HandlerThread;

    const-string v7, "WindowManager"

    move-object/from16 v0, v174

    invoke-direct {v0, v7}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .local v174, wmHandlerThread:Landroid/os/HandlerThread;
    invoke-virtual/range {v174 .. v174}, Landroid/os/HandlerThread;->start()V

    new-instance v21, Landroid/os/Handler;

    invoke-virtual/range {v174 .. v174}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v7

    move-object/from16 v0, v21

    invoke-direct {v0, v7}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .local v21, wmHandler:Landroid/os/Handler;
    new-instance v7, Lcom/android/server/ServerThread$1;

    move-object/from16 v0, p0

    invoke-direct {v7, v0}, Lcom/android/server/ServerThread$1;-><init>(Lcom/android/server/ServerThread;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    const/16 v24, 0x0

    .local v24, onlyCore:Z
    const/16 v108, 0x0

    .local v108, firstBoot:Z
    :try_start_0
    const-string v7, "SystemServer"

    const-string v9, "Waiting for installd to be ready."

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v115, Lcom/android/server/pm/Installer;

    invoke-direct/range {v115 .. v115}, Lcom/android/server/pm/Installer;-><init>()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_64

    .end local v114           #installer:Lcom/android/server/pm/Installer;
    .local v115, installer:Lcom/android/server/pm/Installer;
    :try_start_1
    invoke-virtual/range {v115 .. v115}, Lcom/android/server/pm/Installer;->ping()Z

    const-string v7, "SystemServer"

    const-string v9, "Power Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v135, Lcom/android/server/power/PowerManagerService;

    invoke-direct/range {v135 .. v135}, Lcom/android/server/power/PowerManagerService;-><init>()V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_65

    .end local v4           #power:Lcom/android/server/power/PowerManagerService;
    .local v135, power:Lcom/android/server/power/PowerManagerService;
    :try_start_2
    const-string v7, "power"

    move-object/from16 v0, v135

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    sget-boolean v7, Landroid/util/PowerMoConfig;->WITHOUT_ALL:Z

    if-nez v7, :cond_1

    const-string v7, "SystemServer"

    const-string v9, "Load SmartShowManager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1

    :try_start_3
    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v7

    const-string v9, "com.powermo.smartshow.frameworks.SmartShowManagerService"

    invoke-virtual {v7, v9}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/android/server/ServerThread;->SmartShowManagerService:Ljava/lang/Class;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/ServerThread;->SmartShowManagerService:Ljava/lang/Class;

    const/4 v9, 0x0

    new-array v9, v9, [Ljava/lang/Class;

    invoke-virtual {v7, v9}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v87

    .local v87, ctor:Ljava/lang/reflect/Constructor;
    const/4 v7, 0x1

    move-object/from16 v0, v87

    invoke-virtual {v0, v7}, Ljava/lang/reflect/Constructor;->setAccessible(Z)V

    const/4 v7, 0x0

    new-array v7, v7, [Ljava/lang/Object;

    move-object/from16 v0, v87

    invoke-virtual {v0, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/android/server/ServerThread;->mSmartShowManager:Ljava/lang/Object;

    const-string v9, "SmartShowManager"

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/ServerThread;->mSmartShowManager:Ljava/lang/Object;

    check-cast v7, Landroid/os/IBinder;

    const/4 v10, 0x1

    invoke-static {v9, v7, v10}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;Z)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_1

    .end local v87           #ctor:Ljava/lang/reflect/Constructor;
    :cond_1
    :goto_3
    :try_start_4
    const-string v7, "SystemServer"

    const-string v9, "Activity Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static/range {v106 .. v106}, Lcom/android/server/am/ActivityManagerService;->main(I)Landroid/content/Context;
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_1

    move-result-object v5

    move-object/from16 v4, v135

    .end local v135           #power:Lcom/android/server/power/PowerManagerService;
    .restart local v4       #power:Lcom/android/server/power/PowerManagerService;
    move-object/from16 v114, v115

    .end local v115           #installer:Lcom/android/server/pm/Installer;
    .restart local v114       #installer:Lcom/android/server/pm/Installer;
    :goto_4
    const-string v7, "config.disable_storage"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v96

    .local v96, disableStorage:Z
    const-string v7, "config.disable_media"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v93

    .local v93, disableMedia:Z
    const-string v7, "config.disable_bluetooth"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v91

    .local v91, disableBluetooth:Z
    const-string v7, "config.disable_telephony"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v98

    .local v98, disableTelephony:Z
    const-string v7, "config.disable_location"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v92

    .local v92, disableLocation:Z
    const-string v7, "config.disable_systemui"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v97

    .local v97, disableSystemUI:Z
    const-string v7, "config.disable_noncore"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v95

    .local v95, disableNonCoreServices:Z
    const-string v7, "config.disable_network"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v94

    .local v94, disableNetwork:Z
    const-string v7, "config.disable_atlas"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v90

    .local v90, disableAtlas:Z
    :try_start_5
    const-string v7, "SystemServer"

    const-string v9, "Display Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v11, Lcom/android/server/display/DisplayManagerService;

    move-object/from16 v0, v21

    invoke-direct {v11, v5, v0}, Lcom/android/server/display/DisplayManagerService;-><init>(Landroid/content/Context;Landroid/os/Handler;)V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_56

    .end local v99           #display:Lcom/android/server/display/DisplayManagerService;
    .local v11, display:Lcom/android/server/display/DisplayManagerService;
    :try_start_6
    const-string v7, "display"

    const/4 v9, 0x1

    invoke-static {v7, v11, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;Z)V

    const-string v7, "SystemServer"

    const-string v9, "Telephony Registry"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v153, Lcom/android/server/TelephonyRegistry;

    move-object/from16 v0, v153

    invoke-direct {v0, v5}, Lcom/android/server/TelephonyRegistry;-><init>(Landroid/content/Context;)V
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_57

    .end local v152           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .local v153, telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :try_start_7
    const-string v7, "telephony.registry"

    move-object/from16 v0, v153

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    invoke-static {}, Landroid/telephony/MSimTelephonyManager;->getDefault()Landroid/telephony/MSimTelephonyManager;

    move-result-object v7

    invoke-virtual {v7}, Landroid/telephony/MSimTelephonyManager;->isMultiSimEnabled()Z

    move-result v7

    if-eqz v7, :cond_2

    const-string v7, "SystemServer"

    const-string v9, "MSimTelephony Registry"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v127, Lcom/android/server/MSimTelephonyRegistry;

    move-object/from16 v0, v127

    invoke-direct {v0, v5}, Lcom/android/server/MSimTelephonyRegistry;-><init>(Landroid/content/Context;)V
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_3

    .end local v126           #msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    .local v127, msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    :try_start_8
    const-string v7, "telephony.msim.registry"

    move-object/from16 v0, v127

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_8
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_58

    move-object/from16 v126, v127

    .end local v127           #msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    .restart local v126       #msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    :cond_2
    :try_start_9
    const-string v7, "sys.nubiatel.start"

    const-string v9, "1"

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "SystemServer"

    const-string v9, "Scheduling Policy"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "scheduling_policy"

    new-instance v9, Lcom/android/server/os/SchedulingPolicyService;

    invoke-direct {v9}, Lcom/android/server/os/SchedulingPolicyService;-><init>()V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    invoke-static {v5}, Lcom/android/server/AttributeCache;->init(Landroid/content/Context;)V

    invoke-virtual {v11}, Lcom/android/server/display/DisplayManagerService;->waitForDefaultDisplay()Z

    move-result v7

    if-nez v7, :cond_3

    const-string v7, "Timeout waiting for default display to be initialized."

    new-instance v9, Ljava/lang/Throwable;

    invoke-direct {v9}, Ljava/lang/Throwable;-><init>()V

    move-object/from16 v0, p0

    invoke-virtual {v0, v7, v9}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_3
    const-string v7, "SystemServer"

    const-string v9, "Package Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "vold.decrypt"

    invoke-static {v7}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v86

    .local v86, cryptState:Ljava/lang/String;
    const-string v7, "trigger_restart_min_framework"

    move-object/from16 v0, v86

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_29

    const-string v7, "SystemServer"

    const-string v9, "Detected encryption in progress - only parsing core apps"

    invoke-static {v7, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v24, 0x1

    :cond_4
    :goto_5
    if-eqz v106, :cond_2a

    const/4 v7, 0x1

    :goto_6
    move-object/from16 v0, v114

    move/from16 v1, v24

    invoke-static {v5, v0, v7, v1}, Lcom/android/server/pm/PackageManagerService;->main(Landroid/content/Context;Lcom/android/server/pm/Installer;ZZ)Landroid/content/pm/IPackageManager;
    :try_end_9
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_9} :catch_3

    move-result-object v134

    :try_start_a
    invoke-interface/range {v134 .. v134}, Landroid/content/pm/IPackageManager;->isFirstBoot()Z
    :try_end_a
    .catch Landroid/os/RemoteException; {:try_start_a .. :try_end_a} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_a} :catch_3

    move-result v108

    :goto_7
    :try_start_b
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->setSystemProcess()V

    const-string v7, "SystemServer"

    const-string v9, "Entropy Mixer"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "entropy"

    new-instance v9, Lcom/android/server/EntropyMixer;

    invoke-direct {v9, v5}, Lcom/android/server/EntropyMixer;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    const-string v7, "SystemServer"

    const-string v9, "User Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "user"

    invoke-static {}, Lcom/android/server/pm/UserManagerService;->getInstance()Lcom/android/server/pm/UserManagerService;

    move-result-object v9

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/android/server/ServerThread;->mContentResolver:Landroid/content/ContentResolver;
    :try_end_b
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_b} :catch_3

    :try_start_c
    const-string v7, "SystemServer"

    const-string v9, "Account Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v64, Lcom/android/server/accounts/AccountManagerService;

    move-object/from16 v0, v64

    invoke-direct {v0, v5}, Lcom/android/server/accounts/AccountManagerService;-><init>(Landroid/content/Context;)V
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_c} :catch_3

    .end local v63           #accountManager:Lcom/android/server/accounts/AccountManagerService;
    .local v64, accountManager:Lcom/android/server/accounts/AccountManagerService;
    :try_start_d
    const-string v7, "account"

    move-object/from16 v0, v64

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_d
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_d} :catch_63
    .catch Ljava/lang/RuntimeException; {:try_start_d .. :try_end_d} :catch_59

    move-object/from16 v63, v64

    .end local v64           #accountManager:Lcom/android/server/accounts/AccountManagerService;
    .restart local v63       #accountManager:Lcom/android/server/accounts/AccountManagerService;
    :goto_8
    :try_start_e
    const-string v7, "SystemServer"

    const-string v9, "Content Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v7, 0x1

    move/from16 v0, v106

    if-ne v0, v7, :cond_2b

    const/4 v7, 0x1

    :goto_9
    invoke-static {v5, v7}, Lcom/android/server/content/ContentService;->main(Landroid/content/Context;Z)Lcom/android/server/content/ContentService;

    move-result-object v83

    const-string v7, "SystemServer"

    const-string v9, "System Content Providers"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->installSystemProviders()V

    const-string v7, "SystemServer"

    const-string v9, "breathinglight Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v74, Landroid/os/nubia/breathlight/BreathinglightService;

    move-object/from16 v0, v74

    invoke-direct {v0, v5}, Landroid/os/nubia/breathlight/BreathinglightService;-><init>(Landroid/content/Context;)V
    :try_end_e
    .catch Ljava/lang/RuntimeException; {:try_start_e .. :try_end_e} :catch_3

    .end local v73           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .local v74, breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    :try_start_f
    const-string v7, "breathinglight"

    move-object/from16 v0, v74

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    const-string v7, "SystemServer"

    const-string v9, "Lights Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v6, Lcom/android/server/MiuiLightsService;

    invoke-direct {v6, v5}, Lcom/android/server/MiuiLightsService;-><init>(Landroid/content/Context;)V
    :try_end_f
    .catch Ljava/lang/RuntimeException; {:try_start_f .. :try_end_f} :catch_5a

    .end local v116           #lights:Lcom/android/server/LightsService;
    .local v6, lights:Lcom/android/server/LightsService;
    :try_start_10
    const-string v7, "SystemServer"

    const-string v9, "Battery Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v8, Lcom/android/server/BatteryService;

    invoke-direct {v8, v5, v6}, Lcom/android/server/BatteryService;-><init>(Landroid/content/Context;Lcom/android/server/LightsService;)V
    :try_end_10
    .catch Ljava/lang/RuntimeException; {:try_start_10 .. :try_end_10} :catch_5b

    .end local v70           #battery:Lcom/android/server/BatteryService;
    .local v8, battery:Lcom/android/server/BatteryService;
    :try_start_11
    const-string v7, "battery"

    invoke-static {v7, v8}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    const-string v7, "SystemServer"

    const-string v9, "Vibrator Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v163, Lcom/android/server/VibratorService;

    move-object/from16 v0, v163

    invoke-direct {v0, v5}, Lcom/android/server/VibratorService;-><init>(Landroid/content/Context;)V
    :try_end_11
    .catch Ljava/lang/RuntimeException; {:try_start_11 .. :try_end_11} :catch_5c

    .end local v162           #vibrator:Lcom/android/server/VibratorService;
    .local v163, vibrator:Lcom/android/server/VibratorService;
    :try_start_12
    const-string v7, "vibrator"

    move-object/from16 v0, v163

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    const-string v7, "SystemServer"

    const-string v9, "Haptics Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v110, Lcom/android/server/HapticsService;

    move-object/from16 v0, v110

    invoke-direct {v0, v5}, Lcom/android/server/HapticsService;-><init>(Landroid/content/Context;)V
    :try_end_12
    .catch Ljava/lang/RuntimeException; {:try_start_12 .. :try_end_12} :catch_5d

    .end local v109           #haptics:Lcom/android/server/HapticsService;
    .local v110, haptics:Lcom/android/server/HapticsService;
    :try_start_13
    const-string v7, "haptics"

    move-object/from16 v0, v110

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    const-string v7, "SystemServer"

    const-string v9, "wake gesture"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v166, Lcom/android/server/WakeGestureService;

    invoke-direct/range {v166 .. v166}, Lcom/android/server/WakeGestureService;-><init>()V
    :try_end_13
    .catch Ljava/lang/RuntimeException; {:try_start_13 .. :try_end_13} :catch_5e

    .end local v165           #wakeGesture:Lcom/android/server/WakeGestureService;
    .local v166, wakeGesture:Lcom/android/server/WakeGestureService;
    :try_start_14
    const-string v7, "wakeGesture"

    move-object/from16 v0, v166

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    const-string v7, "SystemServer"

    const-string v9, "Consumer IR Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v82, Lcom/android/server/ConsumerIrService;

    move-object/from16 v0, v82

    invoke-direct {v0, v5}, Lcom/android/server/ConsumerIrService;-><init>(Landroid/content/Context;)V
    :try_end_14
    .catch Ljava/lang/RuntimeException; {:try_start_14 .. :try_end_14} :catch_5f

    .end local v81           #consumerIr:Lcom/android/server/ConsumerIrService;
    .local v82, consumerIr:Lcom/android/server/ConsumerIrService;
    :try_start_15
    const-string v7, "consumer_ir"

    move-object/from16 v0, v82

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v7

    invoke-static {}, Lcom/android/server/am/BatteryStatsService;->getService()Lcom/android/internal/app/IBatteryStats;

    move-result-object v9

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v10

    invoke-virtual {v10}, Lcom/android/server/am/ActivityManagerService;->getAppOpsService()Lcom/android/internal/app/IAppOpsService;

    move-result-object v10

    invoke-virtual/range {v4 .. v11}, Lcom/android/server/power/PowerManagerService;->init(Landroid/content/Context;Lcom/android/server/LightsService;Lcom/android/server/am/ActivityManagerService;Lcom/android/server/BatteryService;Lcom/android/internal/app/IBatteryStats;Lcom/android/internal/app/IAppOpsService;Lcom/android/server/display/DisplayManagerService;)V

    const-string v7, "SystemServer"

    const-string v9, "Alarm Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v16, Lcom/android/server/AlarmManagerService;

    move-object/from16 v0, v16

    invoke-direct {v0, v5}, Lcom/android/server/AlarmManagerService;-><init>(Landroid/content/Context;)V
    :try_end_15
    .catch Ljava/lang/RuntimeException; {:try_start_15 .. :try_end_15} :catch_60

    .end local v65           #alarm:Lcom/android/server/AlarmManagerService;
    .local v16, alarm:Lcom/android/server/AlarmManagerService;
    :try_start_16
    const-string v7, "alarm"

    move-object/from16 v0, v16

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    const-string v7, "SystemServer"

    const-string v9, "Init Watchdog"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v12

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v17

    move-object v13, v5

    move-object v14, v8

    move-object v15, v4

    invoke-virtual/range {v12 .. v17}, Lcom/android/server/Watchdog;->init(Landroid/content/Context;Lcom/android/server/BatteryService;Lcom/android/server/power/PowerManagerService;Lcom/android/server/AlarmManagerService;Lcom/android/server/am/ActivityManagerService;)V

    invoke-static {}, Lcom/android/server/Watchdog;->getInstance()Lcom/android/server/Watchdog;

    move-result-object v7

    const-string v9, "WindowManager thread"

    move-object/from16 v0, v21

    invoke-virtual {v7, v0, v9}, Lcom/android/server/Watchdog;->addThread(Landroid/os/Handler;Ljava/lang/String;)V

    const-string v7, "SystemServer"

    const-string v9, "Input Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v20, Lcom/android/server/input/InputManagerService;

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    invoke-direct {v0, v5, v1}, Lcom/android/server/input/InputManagerService;-><init>(Landroid/content/Context;Landroid/os/Handler;)V
    :try_end_16
    .catch Ljava/lang/RuntimeException; {:try_start_16 .. :try_end_16} :catch_61

    .end local v113           #inputManager:Lcom/android/server/input/InputManagerService;
    .local v20, inputManager:Lcom/android/server/input/InputManagerService;
    :try_start_17
    const-string v7, "SystemServer"

    const-string v9, "Window Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v7, 0x1

    move/from16 v0, v106

    if-eq v0, v7, :cond_2c

    const/16 v22, 0x1

    :goto_a
    if-nez v108, :cond_2d

    const/16 v23, 0x1

    :goto_b
    move-object/from16 v17, v5

    move-object/from16 v18, v4

    move-object/from16 v19, v11

    invoke-static/range {v17 .. v24}, Lcom/android/server/wm/WindowManagerService;->main(Landroid/content/Context;Lcom/android/server/power/PowerManagerService;Lcom/android/server/display/DisplayManagerService;Lcom/android/server/input/InputManagerService;Landroid/os/Handler;ZZZ)Lcom/android/server/wm/WindowManagerService;

    move-result-object v173

    const-string v7, "window"

    move-object/from16 v0, v173

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    const-string v7, "input"

    move-object/from16 v0, v20

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v7

    move-object/from16 v0, v173

    invoke-virtual {v7, v0}, Lcom/android/server/am/ActivityManagerService;->setWindowManager(Lcom/android/server/wm/WindowManagerService;)V

    invoke-virtual/range {v173 .. v173}, Lcom/android/server/wm/WindowManagerService;->getInputMonitor()Lcom/android/server/wm/InputMonitor;

    move-result-object v7

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Lcom/android/server/input/InputManagerService;->setWindowManagerCallbacks(Lcom/android/server/input/InputManagerService$WindowManagerCallbacks;)V

    invoke-virtual/range {v20 .. v20}, Lcom/android/server/input/InputManagerService;->start()V

    move-object/from16 v0, v173

    invoke-virtual {v11, v0}, Lcom/android/server/display/DisplayManagerService;->setWindowManager(Lcom/android/server/display/DisplayManagerService$WindowManagerFuncs;)V

    move-object/from16 v0, v20

    invoke-virtual {v11, v0}, Lcom/android/server/display/DisplayManagerService;->setInputManager(Lcom/android/server/display/DisplayManagerService$InputManagerFuncs;)V

    sget-boolean v7, Landroid/util/PowerMoConfig;->WITHOUT_ALL:Z
    :try_end_17
    .catch Ljava/lang/RuntimeException; {:try_start_17 .. :try_end_17} :catch_5

    if-nez v7, :cond_5

    :try_start_18
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/ServerThread;->SmartShowManagerService:Ljava/lang/Class;

    const-string v9, "init"

    const/4 v10, 0x4

    new-array v10, v10, [Ljava/lang/Class;

    const/4 v12, 0x0

    const-class v13, Landroid/content/Context;

    aput-object v13, v10, v12

    const/4 v12, 0x1

    const-class v13, Lcom/android/server/am/ActivityManagerService;

    aput-object v13, v10, v12

    const/4 v12, 0x2

    const-class v13, Lcom/android/server/wm/WindowManagerService;

    aput-object v13, v10, v12

    const/4 v12, 0x3

    const-class v13, Lcom/android/server/display/DisplayManagerService;

    aput-object v13, v10, v12

    invoke-virtual {v7, v9, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/android/server/ServerThread;->SmartShowManagerInit:Ljava/lang/reflect/Method;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/server/ServerThread;->SmartShowManagerInit:Ljava/lang/reflect/Method;

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/android/server/ServerThread;->mSmartShowManager:Ljava/lang/Object;

    const/4 v10, 0x4

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object v5, v10, v12

    const/4 v12, 0x1

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v13

    aput-object v13, v10, v12

    const/4 v12, 0x2

    aput-object v173, v10, v12

    const/4 v12, 0x3

    aput-object v11, v10, v12

    invoke-virtual {v7, v9, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_18
    .catch Ljava/lang/Throwable; {:try_start_18 .. :try_end_18} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_18 .. :try_end_18} :catch_5

    :cond_5
    :goto_c
    :try_start_19
    const-string v7, "ro.kernel.qemu"

    invoke-static {v7}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v9, "1"

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2e

    const-string v7, "SystemServer"

    const-string v9, "No Bluetooh Service (emulator)"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_d
    invoke-static {}, Lcom/nubia/server/NubiaServer;->addServices()V
    :try_end_19
    .catch Ljava/lang/RuntimeException; {:try_start_19 .. :try_end_19} :catch_5

    move-object/from16 v81, v82

    .end local v82           #consumerIr:Lcom/android/server/ConsumerIrService;
    .restart local v81       #consumerIr:Lcom/android/server/ConsumerIrService;
    move-object/from16 v152, v153

    .end local v153           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v152       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v73, v74

    .end local v74           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v73       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    move-object/from16 v109, v110

    .end local v110           #haptics:Lcom/android/server/HapticsService;
    .restart local v109       #haptics:Lcom/android/server/HapticsService;
    move-object/from16 v165, v166

    .end local v166           #wakeGesture:Lcom/android/server/WakeGestureService;
    .restart local v165       #wakeGesture:Lcom/android/server/WakeGestureService;
    move-object/from16 v162, v163

    .end local v86           #cryptState:Ljava/lang/String;
    .end local v163           #vibrator:Lcom/android/server/VibratorService;
    .restart local v162       #vibrator:Lcom/android/server/VibratorService;
    :goto_e
    const/16 v88, 0x0

    .local v88, devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    const/16 v150, 0x0

    .local v150, statusBar:Lcom/android/server/StatusBarManagerService;
    const/16 v111, 0x0

    .local v111, imm:Lcom/android/server/InputMethodManagerService;
    const/16 v66, 0x0

    .local v66, appWidget:Lcom/android/server/AppWidgetService;
    const/16 v132, 0x0

    .local v132, notification:Lcom/android/server/NotificationManagerService;
    const/16 v167, 0x0

    .local v167, wallpaper:Lcom/android/server/WallpaperManagerService;
    const/16 v117, 0x0

    .local v117, location:Lcom/android/server/LocationManagerService;
    const/16 v84, 0x0

    .local v84, countryDetector:Lcom/android/server/CountryDetectorService;
    const/16 v154, 0x0

    .local v154, tsms:Lcom/android/server/TextServicesManagerService;
    const/16 v119, 0x0

    .local v119, lockSettings:Lcom/android/server/LockSettingsService;
    const/16 v102, 0x0

    .local v102, dreamy:Lcom/android/server/dreams/DreamManagerService;
    const/16 v68, 0x0

    .local v68, atlas:Lcom/android/server/AssetAtlasService;
    const/16 v136, 0x0

    .local v136, printManager:Lcom/android/server/print/PrintManagerService;
    const/16 v121, 0x0

    .local v121, mediaRouter:Lcom/android/server/media/MediaRouterService;
    const/4 v7, 0x1

    move/from16 v0, v106

    if-eq v0, v7, :cond_6

    :try_start_1a
    const-string v7, "SystemServer"

    const-string v9, "Input Method Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v112, Lcom/android/server/InputMethodManagerService;

    move-object/from16 v0, v112

    move-object/from16 v1, v173

    invoke-direct {v0, v5, v1}, Lcom/android/server/InputMethodManagerService;-><init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    :try_end_1a
    .catch Ljava/lang/Throwable; {:try_start_1a .. :try_end_1a} :catch_6

    .end local v111           #imm:Lcom/android/server/InputMethodManagerService;
    .local v112, imm:Lcom/android/server/InputMethodManagerService;
    :try_start_1b
    const-string v7, "input_method"

    move-object/from16 v0, v112

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_1b
    .catch Ljava/lang/Throwable; {:try_start_1b .. :try_end_1b} :catch_55

    move-object/from16 v111, v112

    .end local v112           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v111       #imm:Lcom/android/server/InputMethodManagerService;
    :goto_f
    :try_start_1c
    const-string v7, "SystemServer"

    const-string v9, "Accessibility Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "accessibility"

    new-instance v9, Lcom/android/server/accessibility/AccessibilityManagerService;

    invoke-direct {v9, v5}, Lcom/android/server/accessibility/AccessibilityManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_1c
    .catch Ljava/lang/Throwable; {:try_start_1c .. :try_end_1c} :catch_7

    :cond_6
    :goto_10
    :try_start_1d
    invoke-virtual/range {v173 .. v173}, Lcom/android/server/wm/WindowManagerService;->displayReady()V
    :try_end_1d
    .catch Ljava/lang/Throwable; {:try_start_1d .. :try_end_1d} :catch_8

    :goto_11
    :try_start_1e
    invoke-interface/range {v134 .. v134}, Landroid/content/pm/IPackageManager;->performBootDexOpt()V
    :try_end_1e
    .catch Ljava/lang/Throwable; {:try_start_1e .. :try_end_1e} :catch_9

    :goto_12
    :try_start_1f
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v7

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x1040418

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    move-result-object v9

    const/4 v10, 0x0

    invoke-interface {v7, v9, v10}, Landroid/app/IActivityManager;->showBootMessage(Ljava/lang/CharSequence;Z)V
    :try_end_1f
    .catch Landroid/os/RemoteException; {:try_start_1f .. :try_end_1f} :catch_54

    :goto_13
    const/4 v7, 0x1

    move/from16 v0, v106

    if-eq v0, v7, :cond_36

    if-nez v96, :cond_7

    const-string v7, "0"

    const-string v9, "system_init.startmountservice"

    invoke-static {v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_7

    :try_start_20
    const-string v7, "SystemServer"

    const-string v9, "Mount Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v125, Lcom/android/server/MountService;

    move-object/from16 v0, v125

    invoke-direct {v0, v5}, Lcom/android/server/MountService;-><init>(Landroid/content/Context;)V
    :try_end_20
    .catch Ljava/lang/Throwable; {:try_start_20 .. :try_end_20} :catch_a

    .end local v124           #mountService:Lcom/android/server/MountService;
    .local v125, mountService:Lcom/android/server/MountService;
    :try_start_21
    const-string v7, "mount"

    move-object/from16 v0, v125

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_21
    .catch Ljava/lang/Throwable; {:try_start_21 .. :try_end_21} :catch_53

    move-object/from16 v124, v125

    .end local v125           #mountService:Lcom/android/server/MountService;
    .restart local v124       #mountService:Lcom/android/server/MountService;
    :cond_7
    :goto_14
    if-nez v95, :cond_8

    :try_start_22
    const-string v7, "SystemServer"

    const-string v9, "LockSettingsService"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v120, Lcom/android/server/LockSettingsService;

    move-object/from16 v0, v120

    invoke-direct {v0, v5}, Lcom/android/server/LockSettingsService;-><init>(Landroid/content/Context;)V
    :try_end_22
    .catch Ljava/lang/Throwable; {:try_start_22 .. :try_end_22} :catch_b

    .end local v119           #lockSettings:Lcom/android/server/LockSettingsService;
    .local v120, lockSettings:Lcom/android/server/LockSettingsService;
    :try_start_23
    const-string v7, "lock_settings"

    move-object/from16 v0, v120

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_23
    .catch Ljava/lang/Throwable; {:try_start_23 .. :try_end_23} :catch_52

    move-object/from16 v119, v120

    .end local v120           #lockSettings:Lcom/android/server/LockSettingsService;
    .restart local v119       #lockSettings:Lcom/android/server/LockSettingsService;
    :goto_15
    :try_start_24
    const-string v7, "SystemServer"

    const-string v9, "Device Policy"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v89, Lcom/android/server/DevicePolicyManagerService;

    move-object/from16 v0, v89

    invoke-direct {v0, v5}, Lcom/android/server/DevicePolicyManagerService;-><init>(Landroid/content/Context;)V
    :try_end_24
    .catch Ljava/lang/Throwable; {:try_start_24 .. :try_end_24} :catch_c

    .end local v88           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .local v89, devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :try_start_25
    const-string v7, "device_policy"

    move-object/from16 v0, v89

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_25
    .catch Ljava/lang/Throwable; {:try_start_25 .. :try_end_25} :catch_51

    move-object/from16 v88, v89

    .end local v89           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v88       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :cond_8
    :goto_16
    if-nez v97, :cond_9

    :try_start_26
    const-string v7, "SystemServer"

    const-string v9, "Status Bar"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v151, Lcom/android/server/StatusBarManagerService;

    move-object/from16 v0, v151

    move-object/from16 v1, v173

    invoke-direct {v0, v5, v1}, Lcom/android/server/StatusBarManagerService;-><init>(Landroid/content/Context;Lcom/android/server/wm/WindowManagerService;)V
    :try_end_26
    .catch Ljava/lang/Throwable; {:try_start_26 .. :try_end_26} :catch_d

    .end local v150           #statusBar:Lcom/android/server/StatusBarManagerService;
    .local v151, statusBar:Lcom/android/server/StatusBarManagerService;
    :try_start_27
    const-string v7, "statusbar"

    move-object/from16 v0, v151

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_27
    .catch Ljava/lang/Throwable; {:try_start_27 .. :try_end_27} :catch_50

    move-object/from16 v150, v151

    .end local v151           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v150       #statusBar:Lcom/android/server/StatusBarManagerService;
    :cond_9
    :goto_17
    if-nez v95, :cond_a

    :try_start_28
    const-string v7, "SystemServer"

    const-string v9, "Clipboard Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "clipboard"

    new-instance v9, Lcom/android/server/ClipboardService;

    invoke-direct {v9, v5}, Lcom/android/server/ClipboardService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    const-string v7, "miui.clipserviceext"

    new-instance v9, Lcom/miui/server/ClipServiceExtra;

    invoke-direct {v9}, Lcom/miui/server/ClipServiceExtra;-><init>()V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_28
    .catch Ljava/lang/Throwable; {:try_start_28 .. :try_end_28} :catch_e

    :cond_a
    :goto_18
    if-nez v94, :cond_b

    :try_start_29
    const-string v7, "SystemServer"

    const-string v9, "NetworkManagement Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v5}, Lcom/android/server/NetworkManagementService;->create(Landroid/content/Context;)Lcom/android/server/NetworkManagementService;

    move-result-object v30

    const-string v7, "network_management"

    move-object/from16 v0, v30

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_29
    .catch Ljava/lang/Throwable; {:try_start_29 .. :try_end_29} :catch_f

    :cond_b
    :goto_19
    if-nez v95, :cond_c

    :try_start_2a
    const-string v7, "SystemServer"

    const-string v9, "Text Service Manager Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v155, Lcom/android/server/TextServicesManagerService;

    move-object/from16 v0, v155

    invoke-direct {v0, v5}, Lcom/android/server/TextServicesManagerService;-><init>(Landroid/content/Context;)V
    :try_end_2a
    .catch Ljava/lang/Throwable; {:try_start_2a .. :try_end_2a} :catch_10

    .end local v154           #tsms:Lcom/android/server/TextServicesManagerService;
    .local v155, tsms:Lcom/android/server/TextServicesManagerService;
    :try_start_2b
    const-string v7, "textservices"

    move-object/from16 v0, v155

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2b
    .catch Ljava/lang/Throwable; {:try_start_2b .. :try_end_2b} :catch_4f

    move-object/from16 v154, v155

    .end local v155           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v154       #tsms:Lcom/android/server/TextServicesManagerService;
    :cond_c
    :goto_1a
    if-nez v94, :cond_35

    :try_start_2c
    const-string v7, "SystemServer"

    const-string v9, "NetworkStats Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v129, Lcom/android/server/net/NetworkStatsService;

    move-object/from16 v0, v129

    move-object/from16 v1, v30

    move-object/from16 v2, v16

    invoke-direct {v0, v5, v1, v2}, Lcom/android/server/net/NetworkStatsService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/app/IAlarmManager;)V
    :try_end_2c
    .catch Ljava/lang/Throwable; {:try_start_2c .. :try_end_2c} :catch_11

    .end local v29           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .local v129, networkStats:Lcom/android/server/net/NetworkStatsService;
    :try_start_2d
    const-string v7, "netstats"

    move-object/from16 v0, v129

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2d
    .catch Ljava/lang/Throwable; {:try_start_2d .. :try_end_2d} :catch_4e

    move-object/from16 v29, v129

    .end local v129           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v29       #networkStats:Lcom/android/server/net/NetworkStatsService;
    :goto_1b
    :try_start_2e
    const-string v7, "SystemServer"

    const-string v9, "NetworkPolicy Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v25, Lcom/android/server/net/NetworkPolicyManagerService;

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v27

    move-object/from16 v26, v5

    move-object/from16 v28, v4

    invoke-direct/range {v25 .. v30}, Lcom/android/server/net/NetworkPolicyManagerService;-><init>(Landroid/content/Context;Landroid/app/IActivityManager;Landroid/os/IPowerManager;Landroid/net/INetworkStatsService;Landroid/os/INetworkManagementService;)V
    :try_end_2e
    .catch Ljava/lang/Throwable; {:try_start_2e .. :try_end_2e} :catch_12

    .end local v128           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .local v25, networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    :try_start_2f
    const-string v7, "netpolicy"

    move-object/from16 v0, v25

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_2f
    .catch Ljava/lang/Throwable; {:try_start_2f .. :try_end_2f} :catch_4d

    :goto_1c
    :try_start_30
    const-string v7, "SystemServer"

    const-string v9, "Wi-Fi P2pService"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v172, Landroid/net/wifi/p2p/WifiP2pService;

    move-object/from16 v0, v172

    invoke-direct {v0, v5}, Landroid/net/wifi/p2p/WifiP2pService;-><init>(Landroid/content/Context;)V
    :try_end_30
    .catch Ljava/lang/Throwable; {:try_start_30 .. :try_end_30} :catch_13

    .end local v171           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .local v172, wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :try_start_31
    const-string v7, "wifip2p"

    move-object/from16 v0, v172

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_31
    .catch Ljava/lang/Throwable; {:try_start_31 .. :try_end_31} :catch_4c

    move-object/from16 v171, v172

    .end local v172           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v171       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :goto_1d
    :try_start_32
    const-string v7, "SystemServer"

    const-string v9, "Wi-Fi Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v170, Lcom/android/server/wifi/WifiService;

    move-object/from16 v0, v170

    invoke-direct {v0, v5}, Lcom/android/server/wifi/WifiService;-><init>(Landroid/content/Context;)V
    :try_end_32
    .catch Ljava/lang/Throwable; {:try_start_32 .. :try_end_32} :catch_14

    .end local v169           #wifi:Lcom/android/server/wifi/WifiService;
    .local v170, wifi:Lcom/android/server/wifi/WifiService;
    :try_start_33
    const-string v7, "wifi"

    move-object/from16 v0, v170

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_33
    .catch Ljava/lang/Throwable; {:try_start_33 .. :try_end_33} :catch_4b

    move-object/from16 v169, v170

    .end local v170           #wifi:Lcom/android/server/wifi/WifiService;
    .restart local v169       #wifi:Lcom/android/server/wifi/WifiService;
    :goto_1e
    const/16 v105, 0x1

    .local v105, enableCne:I
    :try_start_34
    invoke-static {}, Lcom/android/server/ServerThread;->deviceHasSufficientMemory()Z

    move-result v7

    if-nez v7, :cond_d

    const-string v7, "persist.cne.override.memlimit"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v105

    :cond_d
    const/4 v7, 0x1

    move/from16 v0, v105

    if-ne v0, v7, :cond_32

    const-string v7, "persist.cne.feature"

    const/4 v9, 0x0

    invoke-static {v7, v9}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v75

    .local v75, cneFeature:I
    :goto_1f
    if-lez v75, :cond_33

    const/16 v7, 0xa

    move/from16 v0, v75

    if-ge v0, v7, :cond_33

    const-string v7, "SystemServer"

    const-string v9, "QcConnectivity Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v140, Ldalvik/system/PathClassLoader;

    const-string v7, "/system/framework/services-ext.jar"

    invoke-static {}, Ljava/lang/ClassLoader;->getSystemClassLoader()Ljava/lang/ClassLoader;

    move-result-object v9

    move-object/from16 v0, v140

    invoke-direct {v0, v7, v9}, Ldalvik/system/PathClassLoader;-><init>(Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .local v140, qcsClassLoader:Ldalvik/system/PathClassLoader;
    const-string v7, "com.android.server.QcConnectivityService"

    move-object/from16 v0, v140

    invoke-virtual {v0, v7}, Ldalvik/system/PathClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v139

    .local v139, qcsClass:Ljava/lang/Class;
    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v9, 0x0

    const-class v10, Landroid/content/Context;

    aput-object v10, v7, v9

    const/4 v9, 0x1

    const-class v10, Landroid/os/INetworkManagementService;

    aput-object v10, v7, v9

    const/4 v9, 0x2

    const-class v10, Landroid/net/INetworkStatsService;

    aput-object v10, v7, v9

    const/4 v9, 0x3

    const-class v10, Landroid/net/INetworkPolicyManager;

    aput-object v10, v7, v9

    move-object/from16 v0, v139

    invoke-virtual {v0, v7}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v141

    .local v141, qcsConstructor:Ljava/lang/reflect/Constructor;
    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v5, v7, v9

    const/4 v9, 0x1

    aput-object v30, v7, v9

    const/4 v9, 0x2

    aput-object v29, v7, v9

    const/4 v9, 0x3

    aput-object v25, v7, v9

    move-object/from16 v0, v141

    invoke-virtual {v0, v7}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v138

    move-object/from16 v0, v138

    check-cast v0, Lcom/android/server/ConnectivityService;

    move-object/from16 v79, v0

    .end local v138           #qcCon:Ljava/lang/Object;
    .end local v139           #qcsClass:Ljava/lang/Class;
    .end local v140           #qcsClassLoader:Ldalvik/system/PathClassLoader;
    .end local v141           #qcsConstructor:Ljava/lang/reflect/Constructor;
    :goto_20
    if-eqz v79, :cond_e

    const-string v7, "connectivity"

    move-object/from16 v0, v79

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    move-object/from16 v0, v29

    move-object/from16 v1, v79

    invoke-virtual {v0, v1}, Lcom/android/server/net/NetworkStatsService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    move-object/from16 v0, v25

    move-object/from16 v1, v79

    invoke-virtual {v0, v1}, Lcom/android/server/net/NetworkPolicyManagerService;->bindConnectivityManager(Landroid/net/IConnectivityManager;)V

    invoke-virtual/range {v169 .. v169}, Lcom/android/server/wifi/WifiService;->checkAndStartWifi()V

    invoke-virtual/range {v171 .. v171}, Landroid/net/wifi/p2p/WifiP2pService;->connectivityServiceReady()V
    :try_end_34
    .catch Ljava/lang/Throwable; {:try_start_34 .. :try_end_34} :catch_15

    .end local v75           #cneFeature:I
    :cond_e
    :goto_21
    :try_start_35
    const-string v7, "SystemServer"

    const-string v9, "Network Service Discovery Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v5}, Lcom/android/server/NsdService;->create(Landroid/content/Context;)Lcom/android/server/NsdService;

    move-result-object v148

    const-string v7, "servicediscovery"

    move-object/from16 v0, v148

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_35
    .catch Ljava/lang/Throwable; {:try_start_35 .. :try_end_35} :catch_16

    .end local v105           #enableCne:I
    :goto_22
    if-nez v95, :cond_f

    :try_start_36
    const-string v7, "SystemServer"

    const-string v9, "UpdateLock Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "updatelock"

    new-instance v9, Lcom/android/server/UpdateLockService;

    invoke-direct {v9, v5}, Lcom/android/server/UpdateLockService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_36
    .catch Ljava/lang/Throwable; {:try_start_36 .. :try_end_36} :catch_17

    :cond_f
    :goto_23
    if-eqz v124, :cond_10

    if-nez v24, :cond_10

    invoke-virtual/range {v124 .. v124}, Lcom/android/server/MountService;->waitForAsecScan()V

    :cond_10
    if-eqz v63, :cond_11

    :try_start_37
    invoke-virtual/range {v63 .. v63}, Lcom/android/server/accounts/AccountManagerService;->systemReady()V
    :try_end_37
    .catch Ljava/lang/Throwable; {:try_start_37 .. :try_end_37} :catch_18

    :cond_11
    :goto_24
    if-eqz v83, :cond_12

    :try_start_38
    invoke-virtual/range {v83 .. v83}, Lcom/android/server/content/ContentService;->systemReady()V
    :try_end_38
    .catch Ljava/lang/Throwable; {:try_start_38 .. :try_end_38} :catch_19

    :cond_12
    :goto_25
    :try_start_39
    const-string v7, "SystemServer"

    const-string v9, "Notification Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v133, Lcom/android/server/NotificationManagerService;

    move-object/from16 v0, v133

    move-object/from16 v1, v150

    invoke-direct {v0, v5, v1, v6}, Lcom/android/server/NotificationManagerService;-><init>(Landroid/content/Context;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LightsService;)V
    :try_end_39
    .catch Ljava/lang/Throwable; {:try_start_39 .. :try_end_39} :catch_1a

    .end local v132           #notification:Lcom/android/server/NotificationManagerService;
    .local v133, notification:Lcom/android/server/NotificationManagerService;
    :try_start_3a
    const-string v7, "notification"

    move-object/from16 v0, v133

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    move-object/from16 v0, v25

    move-object/from16 v1, v133

    invoke-virtual {v0, v1}, Lcom/android/server/net/NetworkPolicyManagerService;->bindNotificationManager(Landroid/app/INotificationManager;)V
    :try_end_3a
    .catch Ljava/lang/Throwable; {:try_start_3a .. :try_end_3a} :catch_4a

    move-object/from16 v132, v133

    .end local v133           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v132       #notification:Lcom/android/server/NotificationManagerService;
    :goto_26
    :try_start_3b
    const-string v7, "SystemServer"

    const-string v9, "Device Storage Monitor"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "devicestoragemonitor"

    new-instance v9, Lcom/android/server/DeviceStorageMonitorService;

    invoke-direct {v9, v5}, Lcom/android/server/DeviceStorageMonitorService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    invoke-static {}, Lcom/android/server/ServerThread$Injector;->setMemoryLowThresholdProperty()V
    :try_end_3b
    .catch Ljava/lang/Throwable; {:try_start_3b .. :try_end_3b} :catch_1b

    :goto_27
    if-nez v92, :cond_13

    :try_start_3c
    const-string v7, "SystemServer"

    const-string v9, "Location Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v118, Lcom/android/server/LocationManagerService;

    move-object/from16 v0, v118

    invoke-direct {v0, v5}, Lcom/android/server/LocationManagerService;-><init>(Landroid/content/Context;)V
    :try_end_3c
    .catch Ljava/lang/Throwable; {:try_start_3c .. :try_end_3c} :catch_1c

    .end local v117           #location:Lcom/android/server/LocationManagerService;
    .local v118, location:Lcom/android/server/LocationManagerService;
    :try_start_3d
    const-string v7, "location"

    move-object/from16 v0, v118

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3d
    .catch Ljava/lang/Throwable; {:try_start_3d .. :try_end_3d} :catch_49

    move-object/from16 v117, v118

    .end local v118           #location:Lcom/android/server/LocationManagerService;
    .restart local v117       #location:Lcom/android/server/LocationManagerService;
    :goto_28
    :try_start_3e
    const-string v7, "SystemServer"

    const-string v9, "Country Detector"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v85, Lcom/android/server/CountryDetectorService;

    move-object/from16 v0, v85

    invoke-direct {v0, v5}, Lcom/android/server/CountryDetectorService;-><init>(Landroid/content/Context;)V
    :try_end_3e
    .catch Ljava/lang/Throwable; {:try_start_3e .. :try_end_3e} :catch_1d

    .end local v84           #countryDetector:Lcom/android/server/CountryDetectorService;
    .local v85, countryDetector:Lcom/android/server/CountryDetectorService;
    :try_start_3f
    const-string v7, "country_detector"

    move-object/from16 v0, v85

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_3f
    .catch Ljava/lang/Throwable; {:try_start_3f .. :try_end_3f} :catch_48

    move-object/from16 v84, v85

    .end local v85           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v84       #countryDetector:Lcom/android/server/CountryDetectorService;
    :cond_13
    :goto_29
    if-nez v95, :cond_14

    :try_start_40
    const-string v7, "SystemServer"

    const-string v9, "Search Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "search"

    new-instance v9, Lcom/android/server/search/SearchManagerService;

    invoke-direct {v9, v5}, Lcom/android/server/search/SearchManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_40
    .catch Ljava/lang/Throwable; {:try_start_40 .. :try_end_40} :catch_1e

    :cond_14
    :goto_2a
    :try_start_41
    const-string v7, "SystemServer"

    const-string v9, "DropBox Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "dropbox"

    new-instance v9, Lcom/android/server/DropBoxManagerService;

    new-instance v10, Ljava/io/File;

    const-string v12, "/data/system/dropbox"

    invoke-direct {v10, v12}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v9, v5, v10}, Lcom/android/server/DropBoxManagerService;-><init>(Landroid/content/Context;Ljava/io/File;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_41
    .catch Ljava/lang/Throwable; {:try_start_41 .. :try_end_41} :catch_1f

    :goto_2b
    if-nez v95, :cond_15

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v9, 0x1110031

    invoke-virtual {v7, v9}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v7

    if-eqz v7, :cond_15

    :try_start_42
    const-string v7, "SystemServer"

    const-string v9, "Wallpaper Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    if-nez v33, :cond_15

    new-instance v168, Lcom/android/server/WallpaperManagerService;

    move-object/from16 v0, v168

    invoke-direct {v0, v5}, Lcom/android/server/WallpaperManagerService;-><init>(Landroid/content/Context;)V
    :try_end_42
    .catch Ljava/lang/Throwable; {:try_start_42 .. :try_end_42} :catch_20

    .end local v167           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .local v168, wallpaper:Lcom/android/server/WallpaperManagerService;
    :try_start_43
    const-string v7, "wallpaper"

    move-object/from16 v0, v168

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_43
    .catch Ljava/lang/Throwable; {:try_start_43 .. :try_end_43} :catch_47

    move-object/from16 v167, v168

    .end local v168           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v167       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :cond_15
    :goto_2c
    if-nez v93, :cond_16

    const-string v7, "0"

    const-string v9, "system_init.startaudioservice"

    invoke-static {v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_16

    :try_start_44
    const-string v7, "SystemServer"

    const-string v9, "Audio Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "audio"

    new-instance v9, Landroid/media/AudioService;

    invoke-direct {v9, v5}, Landroid/media/AudioService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_44
    .catch Ljava/lang/Throwable; {:try_start_44 .. :try_end_44} :catch_21

    :cond_16
    :goto_2d
    if-nez v95, :cond_17

    :try_start_45
    const-string v7, "SystemServer"

    const-string v9, "Dock Observer"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v101, Lcom/android/server/DockObserver;

    move-object/from16 v0, v101

    invoke-direct {v0, v5}, Lcom/android/server/DockObserver;-><init>(Landroid/content/Context;)V
    :try_end_45
    .catch Ljava/lang/Throwable; {:try_start_45 .. :try_end_45} :catch_22

    .end local v100           #dock:Lcom/android/server/DockObserver;
    .local v101, dock:Lcom/android/server/DockObserver;
    move-object/from16 v100, v101

    .end local v101           #dock:Lcom/android/server/DockObserver;
    .restart local v100       #dock:Lcom/android/server/DockObserver;
    :cond_17
    :goto_2e
    if-nez v93, :cond_18

    :try_start_46
    const-string v7, "SystemServer"

    const-string v9, "Wired Accessory Manager"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v7, Lcom/android/server/WiredAccessoryManager;

    move-object/from16 v0, v20

    invoke-direct {v7, v5, v0}, Lcom/android/server/WiredAccessoryManager;-><init>(Landroid/content/Context;Lcom/android/server/input/InputManagerService;)V

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Lcom/android/server/input/InputManagerService;->setWiredAccessoryCallbacks(Lcom/android/server/input/InputManagerService$WiredAccessoryCallbacks;)V
    :try_end_46
    .catch Ljava/lang/Throwable; {:try_start_46 .. :try_end_46} :catch_23

    :cond_18
    :goto_2f
    if-nez v95, :cond_19

    :try_start_47
    const-string v7, "SystemServer"

    const-string v9, "USB Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v161, Lcom/android/server/usb/UsbService;

    move-object/from16 v0, v161

    invoke-direct {v0, v5}, Lcom/android/server/usb/UsbService;-><init>(Landroid/content/Context;)V
    :try_end_47
    .catch Ljava/lang/Throwable; {:try_start_47 .. :try_end_47} :catch_24

    .end local v160           #usb:Lcom/android/server/usb/UsbService;
    .local v161, usb:Lcom/android/server/usb/UsbService;
    :try_start_48
    const-string v7, "usb"

    move-object/from16 v0, v161

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_48
    .catch Ljava/lang/Throwable; {:try_start_48 .. :try_end_48} :catch_46

    move-object/from16 v160, v161

    .end local v161           #usb:Lcom/android/server/usb/UsbService;
    .restart local v160       #usb:Lcom/android/server/usb/UsbService;
    :goto_30
    :try_start_49
    const-string v7, "SystemServer"

    const-string v9, "Serial Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v147, Lcom/android/server/SerialService;

    move-object/from16 v0, v147

    invoke-direct {v0, v5}, Lcom/android/server/SerialService;-><init>(Landroid/content/Context;)V
    :try_end_49
    .catch Ljava/lang/Throwable; {:try_start_49 .. :try_end_49} :catch_25

    .end local v146           #serial:Lcom/android/server/SerialService;
    .local v147, serial:Lcom/android/server/SerialService;
    :try_start_4a
    const-string v7, "serial"

    move-object/from16 v0, v147

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4a
    .catch Ljava/lang/Throwable; {:try_start_4a .. :try_end_4a} :catch_45

    move-object/from16 v146, v147

    .end local v147           #serial:Lcom/android/server/SerialService;
    .restart local v146       #serial:Lcom/android/server/SerialService;
    :cond_19
    :goto_31
    :try_start_4b
    const-string v7, "SystemServer"

    const-string v9, "Twilight Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v157, Lcom/android/server/TwilightService;

    move-object/from16 v0, v157

    invoke-direct {v0, v5}, Lcom/android/server/TwilightService;-><init>(Landroid/content/Context;)V
    :try_end_4b
    .catch Ljava/lang/Throwable; {:try_start_4b .. :try_end_4b} :catch_26

    .end local v156           #twilight:Lcom/android/server/TwilightService;
    .local v157, twilight:Lcom/android/server/TwilightService;
    move-object/from16 v156, v157

    .end local v157           #twilight:Lcom/android/server/TwilightService;
    .restart local v156       #twilight:Lcom/android/server/TwilightService;
    :goto_32
    :try_start_4c
    const-string v7, "SystemServer"

    const-string v9, "UI Mode Manager Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v159, Lcom/android/server/UiModeManagerService;

    move-object/from16 v0, v159

    move-object/from16 v1, v156

    invoke-direct {v0, v5, v1}, Lcom/android/server/UiModeManagerService;-><init>(Landroid/content/Context;Lcom/android/server/TwilightService;)V
    :try_end_4c
    .catch Ljava/lang/Throwable; {:try_start_4c .. :try_end_4c} :catch_27

    .end local v158           #uiMode:Lcom/android/server/UiModeManagerService;
    .local v159, uiMode:Lcom/android/server/UiModeManagerService;
    move-object/from16 v158, v159

    .end local v159           #uiMode:Lcom/android/server/UiModeManagerService;
    .restart local v158       #uiMode:Lcom/android/server/UiModeManagerService;
    :goto_33
    if-nez v95, :cond_1a

    :try_start_4d
    const-string v7, "SystemServer"

    const-string v9, "Backup Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "backup"

    new-instance v9, Lcom/android/server/BackupManagerService;

    invoke-direct {v9, v5}, Lcom/android/server/BackupManagerService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4d
    .catch Ljava/lang/Throwable; {:try_start_4d .. :try_end_4d} :catch_28

    :goto_34
    :try_start_4e
    const-string v7, "SystemServer"

    const-string v9, "AppWidget Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v67, Lcom/android/server/AppWidgetService;

    move-object/from16 v0, v67

    invoke-direct {v0, v5}, Lcom/android/server/AppWidgetService;-><init>(Landroid/content/Context;)V
    :try_end_4e
    .catch Ljava/lang/Throwable; {:try_start_4e .. :try_end_4e} :catch_29

    .end local v66           #appWidget:Lcom/android/server/AppWidgetService;
    .local v67, appWidget:Lcom/android/server/AppWidgetService;
    :try_start_4f
    const-string v7, "appwidget"

    move-object/from16 v0, v67

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_4f
    .catch Ljava/lang/Throwable; {:try_start_4f .. :try_end_4f} :catch_44

    move-object/from16 v66, v67

    .end local v67           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v66       #appWidget:Lcom/android/server/AppWidgetService;
    :goto_35
    :try_start_50
    const-string v7, "SystemServer"

    const-string v9, "Recognition Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v145, Lcom/android/server/RecognitionManagerService;

    move-object/from16 v0, v145

    invoke-direct {v0, v5}, Lcom/android/server/RecognitionManagerService;-><init>(Landroid/content/Context;)V
    :try_end_50
    .catch Ljava/lang/Throwable; {:try_start_50 .. :try_end_50} :catch_2a

    .end local v144           #recognition:Lcom/android/server/RecognitionManagerService;
    .local v145, recognition:Lcom/android/server/RecognitionManagerService;
    move-object/from16 v144, v145

    .end local v145           #recognition:Lcom/android/server/RecognitionManagerService;
    .restart local v144       #recognition:Lcom/android/server/RecognitionManagerService;
    :cond_1a
    :goto_36
    :try_start_51
    const-string v7, "SystemServer"

    const-string v9, "DiskStats Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "diskstats"

    new-instance v9, Lcom/android/server/DiskStatsService;

    invoke-direct {v9, v5}, Lcom/android/server/DiskStatsService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_51
    .catch Ljava/lang/Throwable; {:try_start_51 .. :try_end_51} :catch_2b

    :goto_37
    :try_start_52
    const-string v7, "SystemServer"

    const-string v9, "SamplingProfiler Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "samplingprofiler"

    new-instance v9, Lcom/android/server/SamplingProfilerService;

    invoke-direct {v9, v5}, Lcom/android/server/SamplingProfilerService;-><init>(Landroid/content/Context;)V

    invoke-static {v7, v9}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_52
    .catch Ljava/lang/Throwable; {:try_start_52 .. :try_end_52} :catch_2c

    :goto_38
    if-nez v94, :cond_1b

    :try_start_53
    const-string v7, "SystemServer"

    const-string v9, "NetworkTimeUpdateService"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v131, Lcom/android/server/NetworkTimeUpdateService;

    move-object/from16 v0, v131

    invoke-direct {v0, v5}, Lcom/android/server/NetworkTimeUpdateService;-><init>(Landroid/content/Context;)V
    :try_end_53
    .catch Ljava/lang/Throwable; {:try_start_53 .. :try_end_53} :catch_2d

    .end local v130           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .local v131, networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v130, v131

    .end local v131           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .restart local v130       #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    :cond_1b
    :goto_39
    if-nez v93, :cond_1c

    :try_start_54
    const-string v7, "SystemServer"

    const-string v9, "CommonTimeManagementService"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v77, Lcom/android/server/CommonTimeManagementService;

    move-object/from16 v0, v77

    invoke-direct {v0, v5}, Lcom/android/server/CommonTimeManagementService;-><init>(Landroid/content/Context;)V
    :try_end_54
    .catch Ljava/lang/Throwable; {:try_start_54 .. :try_end_54} :catch_2e

    .end local v76           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .local v77, commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    :try_start_55
    const-string v7, "commontime_management"

    move-object/from16 v0, v77

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_55
    .catch Ljava/lang/Throwable; {:try_start_55 .. :try_end_55} :catch_43

    move-object/from16 v76, v77

    .end local v77           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v76       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    :cond_1c
    :goto_3a
    if-nez v94, :cond_1d

    :try_start_56
    const-string v7, "SystemServer"

    const-string v9, "CertBlacklister"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v7, Lcom/android/server/CertBlacklister;

    invoke-direct {v7, v5}, Lcom/android/server/CertBlacklister;-><init>(Landroid/content/Context;)V
    :try_end_56
    .catch Ljava/lang/Throwable; {:try_start_56 .. :try_end_56} :catch_2f

    :cond_1d
    :goto_3b
    if-nez v95, :cond_1e

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v9, 0x111004a

    invoke-virtual {v7, v9}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v7

    if-eqz v7, :cond_1e

    :try_start_57
    const-string v7, "SystemServer"

    const-string v9, "Dreams Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v103, Lcom/android/server/dreams/DreamManagerService;

    move-object/from16 v0, v103

    move-object/from16 v1, v21

    invoke-direct {v0, v5, v1}, Lcom/android/server/dreams/DreamManagerService;-><init>(Landroid/content/Context;Landroid/os/Handler;)V
    :try_end_57
    .catch Ljava/lang/Throwable; {:try_start_57 .. :try_end_57} :catch_30

    .end local v102           #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .local v103, dreamy:Lcom/android/server/dreams/DreamManagerService;
    :try_start_58
    const-string v7, "dreams"

    move-object/from16 v0, v103

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_58
    .catch Ljava/lang/Throwable; {:try_start_58 .. :try_end_58} :catch_42

    move-object/from16 v102, v103

    .end local v103           #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .restart local v102       #dreamy:Lcom/android/server/dreams/DreamManagerService;
    :cond_1e
    :goto_3c
    if-nez v95, :cond_1f

    if-nez v90, :cond_1f

    :try_start_59
    const-string v7, "SystemServer"

    const-string v9, "Assets Atlas Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v69, Lcom/android/server/AssetAtlasService;

    move-object/from16 v0, v69

    invoke-direct {v0, v5}, Lcom/android/server/AssetAtlasService;-><init>(Landroid/content/Context;)V
    :try_end_59
    .catch Ljava/lang/Throwable; {:try_start_59 .. :try_end_59} :catch_31

    .end local v68           #atlas:Lcom/android/server/AssetAtlasService;
    .local v69, atlas:Lcom/android/server/AssetAtlasService;
    :try_start_5a
    const-string v7, "assetatlas"

    move-object/from16 v0, v69

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_5a
    .catch Ljava/lang/Throwable; {:try_start_5a .. :try_end_5a} :catch_41

    move-object/from16 v68, v69

    .end local v69           #atlas:Lcom/android/server/AssetAtlasService;
    .restart local v68       #atlas:Lcom/android/server/AssetAtlasService;
    :cond_1f
    :goto_3d
    :try_start_5b
    const-string v7, "SystemServer"

    const-string v9, "IdleMaintenanceService"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v7, Lcom/android/server/IdleMaintenanceService;

    invoke-direct {v7, v5, v8}, Lcom/android/server/IdleMaintenanceService;-><init>(Landroid/content/Context;Lcom/android/server/BatteryService;)V
    :try_end_5b
    .catch Ljava/lang/Throwable; {:try_start_5b .. :try_end_5b} :catch_32

    :goto_3e
    :try_start_5c
    const-string v7, "SystemServer"

    const-string v9, "Print Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v137, Lcom/android/server/print/PrintManagerService;

    move-object/from16 v0, v137

    invoke-direct {v0, v5}, Lcom/android/server/print/PrintManagerService;-><init>(Landroid/content/Context;)V
    :try_end_5c
    .catch Ljava/lang/Throwable; {:try_start_5c .. :try_end_5c} :catch_33

    .end local v136           #printManager:Lcom/android/server/print/PrintManagerService;
    .local v137, printManager:Lcom/android/server/print/PrintManagerService;
    :try_start_5d
    const-string v7, "print"

    move-object/from16 v0, v137

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_5d
    .catch Ljava/lang/Throwable; {:try_start_5d .. :try_end_5d} :catch_40

    move-object/from16 v136, v137

    .end local v137           #printManager:Lcom/android/server/print/PrintManagerService;
    .restart local v136       #printManager:Lcom/android/server/print/PrintManagerService;
    :goto_3f
    if-nez v95, :cond_20

    :try_start_5e
    const-string v7, "SystemServer"

    const-string v9, "Media Router Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v122, Lcom/android/server/media/MediaRouterService;

    move-object/from16 v0, v122

    invoke-direct {v0, v5}, Lcom/android/server/media/MediaRouterService;-><init>(Landroid/content/Context;)V
    :try_end_5e
    .catch Ljava/lang/Throwable; {:try_start_5e .. :try_end_5e} :catch_34

    .end local v121           #mediaRouter:Lcom/android/server/media/MediaRouterService;
    .local v122, mediaRouter:Lcom/android/server/media/MediaRouterService;
    :try_start_5f
    const-string v7, "media_router"

    move-object/from16 v0, v122

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_5f
    .catch Ljava/lang/Throwable; {:try_start_5f .. :try_end_5f} :catch_3f

    move-object/from16 v121, v122

    .end local v122           #mediaRouter:Lcom/android/server/media/MediaRouterService;
    .restart local v121       #mediaRouter:Lcom/android/server/media/MediaRouterService;
    :cond_20
    :goto_40
    invoke-virtual/range {v173 .. v173}, Lcom/android/server/wm/WindowManagerService;->detectSafeMode()Z

    move-result v47

    .local v47, safeMode:Z
    if-eqz v47, :cond_34

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/server/am/ActivityManagerService;->enterSafeMode()V

    const/4 v7, 0x1

    sput-boolean v7, Ldalvik/system/Zygote;->systemInSafeMode:Z

    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v7

    invoke-virtual {v7}, Ldalvik/system/VMRuntime;->disableJitCompilation()V

    :goto_41
    :try_start_60
    invoke-virtual/range {v162 .. v162}, Lcom/android/server/VibratorService;->systemReady()V
    :try_end_60
    .catch Ljava/lang/Throwable; {:try_start_60 .. :try_end_60} :catch_35

    :goto_42
    :try_start_61
    invoke-virtual/range {v109 .. v109}, Lcom/android/server/HapticsService;->systemReady()V
    :try_end_61
    .catch Ljava/lang/Throwable; {:try_start_61 .. :try_end_61} :catch_36

    :goto_43
    if-eqz v119, :cond_21

    :try_start_62
    invoke-virtual/range {v119 .. v119}, Lcom/android/server/LockSettingsService;->systemReady()V
    :try_end_62
    .catch Ljava/lang/Throwable; {:try_start_62 .. :try_end_62} :catch_37

    :cond_21
    :goto_44
    if-eqz v88, :cond_22

    :try_start_63
    invoke-virtual/range {v88 .. v88}, Lcom/android/server/DevicePolicyManagerService;->systemReady()V
    :try_end_63
    .catch Ljava/lang/Throwable; {:try_start_63 .. :try_end_63} :catch_38

    :cond_22
    :goto_45
    if-eqz v132, :cond_23

    :try_start_64
    invoke-virtual/range {v132 .. v132}, Lcom/android/server/NotificationManagerService;->systemReady()V
    :try_end_64
    .catch Ljava/lang/Throwable; {:try_start_64 .. :try_end_64} :catch_39

    :cond_23
    :goto_46
    :try_start_65
    invoke-virtual/range {v173 .. v173}, Lcom/android/server/wm/WindowManagerService;->systemReady()V
    :try_end_65
    .catch Ljava/lang/Throwable; {:try_start_65 .. :try_end_65} :catch_3a

    :goto_47
    if-eqz v47, :cond_24

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/server/am/ActivityManagerService;->showSafeModeOverlay()V

    :cond_24
    invoke-virtual/range {v173 .. v173}, Lcom/android/server/wm/WindowManagerService;->computeNewConfiguration()Landroid/content/res/Configuration;

    move-result-object v78

    .local v78, config:Landroid/content/res/Configuration;
    new-instance v123, Landroid/util/DisplayMetrics;

    invoke-direct/range {v123 .. v123}, Landroid/util/DisplayMetrics;-><init>()V

    .local v123, metrics:Landroid/util/DisplayMetrics;
    const-string v7, "window"

    invoke-virtual {v5, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v164

    check-cast v164, Landroid/view/WindowManager;

    .local v164, w:Landroid/view/WindowManager;
    invoke-interface/range {v164 .. v164}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v7

    move-object/from16 v0, v123

    invoke-virtual {v7, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    move-object/from16 v0, v78

    move-object/from16 v1, v123

    invoke-virtual {v7, v0, v1}, Landroid/content/res/Resources;->updateConfiguration(Landroid/content/res/Configuration;Landroid/util/DisplayMetrics;)V

    :try_start_66
    move-object/from16 v0, v156

    move-object/from16 v1, v102

    invoke-virtual {v4, v0, v1}, Lcom/android/server/power/PowerManagerService;->systemReady(Lcom/android/server/TwilightService;Lcom/android/server/dreams/DreamManagerService;)V
    :try_end_66
    .catch Ljava/lang/Throwable; {:try_start_66 .. :try_end_66} :catch_3b

    :goto_48
    :try_start_67
    invoke-interface/range {v134 .. v134}, Landroid/content/pm/IPackageManager;->systemReady()V
    :try_end_67
    .catch Ljava/lang/Throwable; {:try_start_67 .. :try_end_67} :catch_3c

    :goto_49
    :try_start_68
    move/from16 v0, v47

    move/from16 v1, v24

    invoke-virtual {v11, v0, v1}, Lcom/android/server/display/DisplayManagerService;->systemReady(ZZ)V
    :try_end_68
    .catch Ljava/lang/Throwable; {:try_start_68 .. :try_end_68} :catch_3d

    :goto_4a
    move-object/from16 v34, v5

    .local v34, contextF:Landroid/content/Context;
    move-object/from16 v35, v124

    .local v35, mountServiceF:Lcom/android/server/MountService;
    move-object/from16 v36, v8

    .local v36, batteryF:Lcom/android/server/BatteryService;
    move-object/from16 v37, v30

    .local v37, networkManagementF:Lcom/android/server/NetworkManagementService;
    move-object/from16 v38, v29

    .local v38, networkStatsF:Lcom/android/server/net/NetworkStatsService;
    move-object/from16 v39, v25

    .local v39, networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;
    move-object/from16 v40, v79

    .local v40, connectivityF:Lcom/android/server/ConnectivityService;
    move-object/from16 v41, v100

    .local v41, dockF:Lcom/android/server/DockObserver;
    move-object/from16 v42, v160

    .local v42, usbF:Lcom/android/server/usb/UsbService;
    move-object/from16 v43, v156

    .local v43, twilightF:Lcom/android/server/TwilightService;
    move-object/from16 v44, v158

    .local v44, uiModeF:Lcom/android/server/UiModeManagerService;
    move-object/from16 v46, v66

    .local v46, appWidgetF:Lcom/android/server/AppWidgetService;
    move-object/from16 v48, v167

    .local v48, wallpaperF:Lcom/android/server/WallpaperManagerService;
    move-object/from16 v49, v111

    .local v49, immF:Lcom/android/server/InputMethodManagerService;
    move-object/from16 v45, v144

    .local v45, recognitionF:Lcom/android/server/RecognitionManagerService;
    move-object/from16 v51, v117

    .local v51, locationF:Lcom/android/server/LocationManagerService;
    move-object/from16 v52, v84

    .local v52, countryDetectorF:Lcom/android/server/CountryDetectorService;
    move-object/from16 v53, v130

    .local v53, networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;
    move-object/from16 v54, v76

    .local v54, commonTimeMgmtServiceF:Lcom/android/server/CommonTimeManagementService;
    move-object/from16 v55, v154

    .local v55, textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;
    move-object/from16 v50, v150

    .local v50, statusBarF:Lcom/android/server/StatusBarManagerService;
    move-object/from16 v56, v102

    .local v56, dreamyF:Lcom/android/server/dreams/DreamManagerService;
    move-object/from16 v57, v68

    .local v57, atlasF:Lcom/android/server/AssetAtlasService;
    move-object/from16 v58, v20

    .local v58, inputManagerF:Lcom/android/server/input/InputManagerService;
    move-object/from16 v59, v152

    .local v59, telephonyRegistryF:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v60, v126

    .local v60, msimTelephonyRegistryF:Lcom/android/server/MSimTelephonyRegistry;
    move-object/from16 v61, v136

    .local v61, printManagerF:Lcom/android/server/print/PrintManagerService;
    move-object/from16 v62, v121

    .local v62, mediaRouterF:Lcom/android/server/media/MediaRouterService;
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->self()Lcom/android/server/am/ActivityManagerService;

    move-result-object v7

    new-instance v31, Lcom/android/server/ServerThread$2;

    move-object/from16 v32, p0

    invoke-direct/range {v31 .. v62}, Lcom/android/server/ServerThread$2;-><init>(Lcom/android/server/ServerThread;ZLandroid/content/Context;Lcom/android/server/MountService;Lcom/android/server/BatteryService;Lcom/android/server/NetworkManagementService;Lcom/android/server/net/NetworkStatsService;Lcom/android/server/net/NetworkPolicyManagerService;Lcom/android/server/ConnectivityService;Lcom/android/server/DockObserver;Lcom/android/server/usb/UsbService;Lcom/android/server/TwilightService;Lcom/android/server/UiModeManagerService;Lcom/android/server/RecognitionManagerService;Lcom/android/server/AppWidgetService;ZLcom/android/server/WallpaperManagerService;Lcom/android/server/InputMethodManagerService;Lcom/android/server/StatusBarManagerService;Lcom/android/server/LocationManagerService;Lcom/android/server/CountryDetectorService;Lcom/android/server/NetworkTimeUpdateService;Lcom/android/server/CommonTimeManagementService;Lcom/android/server/TextServicesManagerService;Lcom/android/server/dreams/DreamManagerService;Lcom/android/server/AssetAtlasService;Lcom/android/server/input/InputManagerService;Lcom/android/server/TelephonyRegistry;Lcom/android/server/MSimTelephonyRegistry;Lcom/android/server/print/PrintManagerService;Lcom/android/server/media/MediaRouterService;)V

    move-object/from16 v0, v31

    invoke-virtual {v7, v0}, Lcom/android/server/am/ActivityManagerService;->systemReady(Ljava/lang/Runnable;)V

    invoke-static {}, Landroid/os/StrictMode;->conditionallyEnableDebugLogging()Z

    move-result v7

    if-eqz v7, :cond_25

    const-string v7, "SystemServer"

    const-string v9, "Enabled StrictMode for system server main thread."

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_25
    invoke-static {}, Landroid/os/Looper;->loop()V

    const-string v7, "SystemServer"

    const-string v9, "System ServerThread is exiting!"

    invoke-static {v7, v9}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .end local v4           #power:Lcom/android/server/power/PowerManagerService;
    .end local v5           #context:Landroid/content/Context;
    .end local v6           #lights:Lcom/android/server/LightsService;
    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v11           #display:Lcom/android/server/display/DisplayManagerService;
    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v21           #wmHandler:Landroid/os/Handler;
    .end local v24           #onlyCore:Z
    .end local v25           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v29           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .end local v30           #networkManagement:Lcom/android/server/NetworkManagementService;
    .end local v33           #headless:Z
    .end local v34           #contextF:Landroid/content/Context;
    .end local v35           #mountServiceF:Lcom/android/server/MountService;
    .end local v36           #batteryF:Lcom/android/server/BatteryService;
    .end local v37           #networkManagementF:Lcom/android/server/NetworkManagementService;
    .end local v38           #networkStatsF:Lcom/android/server/net/NetworkStatsService;
    .end local v39           #networkPolicyF:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v40           #connectivityF:Lcom/android/server/ConnectivityService;
    .end local v41           #dockF:Lcom/android/server/DockObserver;
    .end local v42           #usbF:Lcom/android/server/usb/UsbService;
    .end local v43           #twilightF:Lcom/android/server/TwilightService;
    .end local v44           #uiModeF:Lcom/android/server/UiModeManagerService;
    .end local v45           #recognitionF:Lcom/android/server/RecognitionManagerService;
    .end local v46           #appWidgetF:Lcom/android/server/AppWidgetService;
    .end local v47           #safeMode:Z
    .end local v48           #wallpaperF:Lcom/android/server/WallpaperManagerService;
    .end local v49           #immF:Lcom/android/server/InputMethodManagerService;
    .end local v50           #statusBarF:Lcom/android/server/StatusBarManagerService;
    .end local v51           #locationF:Lcom/android/server/LocationManagerService;
    .end local v52           #countryDetectorF:Lcom/android/server/CountryDetectorService;
    .end local v53           #networkTimeUpdaterF:Lcom/android/server/NetworkTimeUpdateService;
    .end local v54           #commonTimeMgmtServiceF:Lcom/android/server/CommonTimeManagementService;
    .end local v55           #textServiceManagerServiceF:Lcom/android/server/TextServicesManagerService;
    .end local v56           #dreamyF:Lcom/android/server/dreams/DreamManagerService;
    .end local v57           #atlasF:Lcom/android/server/AssetAtlasService;
    .end local v58           #inputManagerF:Lcom/android/server/input/InputManagerService;
    .end local v59           #telephonyRegistryF:Lcom/android/server/TelephonyRegistry;
    .end local v60           #msimTelephonyRegistryF:Lcom/android/server/MSimTelephonyRegistry;
    .end local v61           #printManagerF:Lcom/android/server/print/PrintManagerService;
    .end local v62           #mediaRouterF:Lcom/android/server/media/MediaRouterService;
    .end local v63           #accountManager:Lcom/android/server/accounts/AccountManagerService;
    .end local v66           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v68           #atlas:Lcom/android/server/AssetAtlasService;
    .end local v71           #bluetooth:Lcom/android/server/BluetoothManagerService;
    .end local v73           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .end local v76           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .end local v78           #config:Landroid/content/res/Configuration;
    .end local v79           #connectivity:Lcom/android/server/ConnectivityService;
    .end local v81           #consumerIr:Lcom/android/server/ConsumerIrService;
    .end local v83           #contentService:Lcom/android/server/content/ContentService;
    .end local v84           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v88           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v90           #disableAtlas:Z
    .end local v91           #disableBluetooth:Z
    .end local v92           #disableLocation:Z
    .end local v93           #disableMedia:Z
    .end local v94           #disableNetwork:Z
    .end local v95           #disableNonCoreServices:Z
    .end local v96           #disableStorage:Z
    .end local v97           #disableSystemUI:Z
    .end local v98           #disableTelephony:Z
    .end local v100           #dock:Lcom/android/server/DockObserver;
    .end local v102           #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .end local v106           #factoryTest:I
    .end local v107           #factoryTestStr:Ljava/lang/String;
    .end local v108           #firstBoot:Z
    .end local v109           #haptics:Lcom/android/server/HapticsService;
    .end local v111           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v114           #installer:Lcom/android/server/pm/Installer;
    .end local v117           #location:Lcom/android/server/LocationManagerService;
    .end local v119           #lockSettings:Lcom/android/server/LockSettingsService;
    .end local v121           #mediaRouter:Lcom/android/server/media/MediaRouterService;
    .end local v123           #metrics:Landroid/util/DisplayMetrics;
    .end local v124           #mountService:Lcom/android/server/MountService;
    .end local v126           #msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    .end local v130           #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .end local v132           #notification:Lcom/android/server/NotificationManagerService;
    .end local v134           #pm:Landroid/content/pm/IPackageManager;
    .end local v136           #printManager:Lcom/android/server/print/PrintManagerService;
    .end local v144           #recognition:Lcom/android/server/RecognitionManagerService;
    .end local v146           #serial:Lcom/android/server/SerialService;
    .end local v148           #serviceDiscovery:Lcom/android/server/NsdService;
    .end local v150           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v152           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v154           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v156           #twilight:Lcom/android/server/TwilightService;
    .end local v158           #uiMode:Lcom/android/server/UiModeManagerService;
    .end local v160           #usb:Lcom/android/server/usb/UsbService;
    .end local v162           #vibrator:Lcom/android/server/VibratorService;
    .end local v164           #w:Landroid/view/WindowManager;
    .end local v165           #wakeGesture:Lcom/android/server/WakeGestureService;
    .end local v167           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .end local v169           #wifi:Lcom/android/server/wifi/WifiService;
    .end local v171           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .end local v173           #wm:Lcom/android/server/wm/WindowManagerService;
    .end local v174           #wmHandlerThread:Landroid/os/HandlerThread;
    :cond_26
    const/16 v143, 0x0

    goto/16 :goto_0

    .restart local v143       #reboot:Z
    :cond_27
    const/16 v142, 0x0

    .restart local v142       #reason:Ljava/lang/String;
    goto/16 :goto_1

    .end local v142           #reason:Ljava/lang/String;
    .end local v143           #reboot:Z
    .restart local v107       #factoryTestStr:Ljava/lang/String;
    :cond_28
    invoke-static/range {v107 .. v107}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v106

    goto/16 :goto_2

    .restart local v5       #context:Landroid/content/Context;
    .restart local v21       #wmHandler:Landroid/os/Handler;
    .restart local v24       #onlyCore:Z
    .restart local v29       #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v30       #networkManagement:Lcom/android/server/NetworkManagementService;
    .restart local v33       #headless:Z
    .restart local v63       #accountManager:Lcom/android/server/accounts/AccountManagerService;
    .restart local v65       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v70       #battery:Lcom/android/server/BatteryService;
    .restart local v71       #bluetooth:Lcom/android/server/BluetoothManagerService;
    .restart local v73       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v76       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v79       #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v81       #consumerIr:Lcom/android/server/ConsumerIrService;
    .restart local v83       #contentService:Lcom/android/server/content/ContentService;
    .restart local v99       #display:Lcom/android/server/display/DisplayManagerService;
    .restart local v100       #dock:Lcom/android/server/DockObserver;
    .restart local v106       #factoryTest:I
    .restart local v108       #firstBoot:Z
    .restart local v109       #haptics:Lcom/android/server/HapticsService;
    .restart local v113       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v115       #installer:Lcom/android/server/pm/Installer;
    .restart local v116       #lights:Lcom/android/server/LightsService;
    .restart local v124       #mountService:Lcom/android/server/MountService;
    .restart local v126       #msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    .restart local v128       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v130       #networkTimeUpdater:Lcom/android/server/NetworkTimeUpdateService;
    .restart local v134       #pm:Landroid/content/pm/IPackageManager;
    .restart local v135       #power:Lcom/android/server/power/PowerManagerService;
    .restart local v138       #qcCon:Ljava/lang/Object;
    .restart local v144       #recognition:Lcom/android/server/RecognitionManagerService;
    .restart local v146       #serial:Lcom/android/server/SerialService;
    .restart local v148       #serviceDiscovery:Lcom/android/server/NsdService;
    .restart local v152       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v156       #twilight:Lcom/android/server/TwilightService;
    .restart local v158       #uiMode:Lcom/android/server/UiModeManagerService;
    .restart local v160       #usb:Lcom/android/server/usb/UsbService;
    .restart local v162       #vibrator:Lcom/android/server/VibratorService;
    .restart local v165       #wakeGesture:Lcom/android/server/WakeGestureService;
    .restart local v169       #wifi:Lcom/android/server/wifi/WifiService;
    .restart local v171       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v173       #wm:Lcom/android/server/wm/WindowManagerService;
    .restart local v174       #wmHandlerThread:Landroid/os/HandlerThread;
    :catch_0
    move-exception v104

    .local v104, e:Ljava/lang/Exception;
    :try_start_69
    const-string v7, "System"

    const-string v9, "Failed to load SmartShowManager"

    invoke-static {v7, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/android/server/ServerThread;->mSmartShowManager:Ljava/lang/Object;
    :try_end_69
    .catch Ljava/lang/RuntimeException; {:try_start_69 .. :try_end_69} :catch_1

    goto/16 :goto_3

    .end local v104           #e:Ljava/lang/Exception;
    :catch_1
    move-exception v104

    move-object/from16 v4, v135

    .end local v135           #power:Lcom/android/server/power/PowerManagerService;
    .restart local v4       #power:Lcom/android/server/power/PowerManagerService;
    move-object/from16 v114, v115

    .end local v115           #installer:Lcom/android/server/pm/Installer;
    .local v104, e:Ljava/lang/RuntimeException;
    .restart local v114       #installer:Lcom/android/server/pm/Installer;
    :goto_4b
    const-string v7, "System"

    const-string v9, "******************************************"

    invoke-static {v7, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "System"

    const-string v9, "************ Failure starting bootstrap service"

    move-object/from16 v0, v104

    invoke-static {v7, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_4

    .end local v99           #display:Lcom/android/server/display/DisplayManagerService;
    .end local v104           #e:Ljava/lang/RuntimeException;
    .end local v152           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v11       #display:Lcom/android/server/display/DisplayManagerService;
    .restart local v86       #cryptState:Ljava/lang/String;
    .restart local v90       #disableAtlas:Z
    .restart local v91       #disableBluetooth:Z
    .restart local v92       #disableLocation:Z
    .restart local v93       #disableMedia:Z
    .restart local v94       #disableNetwork:Z
    .restart local v95       #disableNonCoreServices:Z
    .restart local v96       #disableStorage:Z
    .restart local v97       #disableSystemUI:Z
    .restart local v98       #disableTelephony:Z
    .restart local v153       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :cond_29
    :try_start_6a
    const-string v7, "1"

    move-object/from16 v0, v86

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    const-string v7, "SystemServer"

    const-string v9, "Device encrypted - only parsing core apps"

    invoke-static {v7, v9}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/16 v24, 0x1

    goto/16 :goto_5

    :cond_2a
    const/4 v7, 0x0

    goto/16 :goto_6

    :catch_2
    move-exception v104

    .local v104, e:Ljava/lang/Throwable;
    :goto_4c
    const-string v7, "SystemServer"

    const-string v9, "Failure starting Account Manager"

    move-object/from16 v0, v104

    invoke-static {v7, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_6a
    .catch Ljava/lang/RuntimeException; {:try_start_6a .. :try_end_6a} :catch_3

    goto/16 :goto_8

    .end local v86           #cryptState:Ljava/lang/String;
    .end local v104           #e:Ljava/lang/Throwable;
    :catch_3
    move-exception v104

    move-object/from16 v152, v153

    .end local v153           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v152       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v20, v113

    .end local v113           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v70

    .end local v70           #battery:Lcom/android/server/BatteryService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v6, v116

    .end local v116           #lights:Lcom/android/server/LightsService;
    .restart local v6       #lights:Lcom/android/server/LightsService;
    .local v104, e:Ljava/lang/RuntimeException;
    :goto_4d
    const-string v7, "System"

    const-string v9, "******************************************"

    invoke-static {v7, v9}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "System"

    const-string v9, "************ Failure starting core service"

    move-object/from16 v0, v104

    invoke-static {v7, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_e

    .end local v6           #lights:Lcom/android/server/LightsService;
    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v104           #e:Ljava/lang/RuntimeException;
    .end local v152           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v65       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v70       #battery:Lcom/android/server/BatteryService;
    .restart local v86       #cryptState:Ljava/lang/String;
    .restart local v113       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v116       #lights:Lcom/android/server/LightsService;
    .restart local v153       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :cond_2b
    const/4 v7, 0x0

    goto/16 :goto_9

    .end local v65           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v70           #battery:Lcom/android/server/BatteryService;
    .end local v73           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .end local v81           #consumerIr:Lcom/android/server/ConsumerIrService;
    .end local v109           #haptics:Lcom/android/server/HapticsService;
    .end local v113           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v116           #lights:Lcom/android/server/LightsService;
    .end local v162           #vibrator:Lcom/android/server/VibratorService;
    .end local v165           #wakeGesture:Lcom/android/server/WakeGestureService;
    .restart local v6       #lights:Lcom/android/server/LightsService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v74       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v82       #consumerIr:Lcom/android/server/ConsumerIrService;
    .restart local v110       #haptics:Lcom/android/server/HapticsService;
    .restart local v163       #vibrator:Lcom/android/server/VibratorService;
    .restart local v166       #wakeGesture:Lcom/android/server/WakeGestureService;
    :cond_2c
    const/16 v22, 0x0

    goto/16 :goto_a

    :cond_2d
    const/16 v23, 0x0

    goto/16 :goto_b

    :catch_4
    move-exception v104

    .local v104, e:Ljava/lang/Throwable;
    :try_start_6b
    const-string v7, "failed to init smartshow"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_c

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_5
    move-exception v104

    move-object/from16 v81, v82

    .end local v82           #consumerIr:Lcom/android/server/ConsumerIrService;
    .restart local v81       #consumerIr:Lcom/android/server/ConsumerIrService;
    move-object/from16 v152, v153

    .end local v153           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v152       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v73, v74

    .end local v74           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v73       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    move-object/from16 v109, v110

    .end local v110           #haptics:Lcom/android/server/HapticsService;
    .restart local v109       #haptics:Lcom/android/server/HapticsService;
    move-object/from16 v165, v166

    .end local v166           #wakeGesture:Lcom/android/server/WakeGestureService;
    .restart local v165       #wakeGesture:Lcom/android/server/WakeGestureService;
    move-object/from16 v162, v163

    .end local v163           #vibrator:Lcom/android/server/VibratorService;
    .restart local v162       #vibrator:Lcom/android/server/VibratorService;
    goto :goto_4d

    .end local v73           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .end local v81           #consumerIr:Lcom/android/server/ConsumerIrService;
    .end local v109           #haptics:Lcom/android/server/HapticsService;
    .end local v152           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v162           #vibrator:Lcom/android/server/VibratorService;
    .end local v165           #wakeGesture:Lcom/android/server/WakeGestureService;
    .restart local v74       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v82       #consumerIr:Lcom/android/server/ConsumerIrService;
    .restart local v110       #haptics:Lcom/android/server/HapticsService;
    .restart local v153       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v163       #vibrator:Lcom/android/server/VibratorService;
    .restart local v166       #wakeGesture:Lcom/android/server/WakeGestureService;
    :cond_2e
    const/4 v7, 0x1

    move/from16 v0, v106

    if-ne v0, v7, :cond_2f

    const-string v7, "SystemServer"

    const-string v9, "No Bluetooth Service (factory test)"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_d

    :cond_2f
    invoke-virtual {v5}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    const-string v9, "android.hardware.bluetooth"

    invoke-virtual {v7, v9}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_30

    const-string v7, "SystemServer"

    const-string v9, "No Bluetooth Service (Bluetooth Hardware Not Present)"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_d

    :cond_30
    if-eqz v91, :cond_31

    const-string v7, "SystemServer"

    const-string v9, "Bluetooth Service disabled by config"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_d

    :cond_31
    const-string v7, "SystemServer"

    const-string v9, "Bluetooth Manager Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v72, Lcom/android/server/BluetoothManagerService;

    move-object/from16 v0, v72

    invoke-direct {v0, v5}, Lcom/android/server/BluetoothManagerService;-><init>(Landroid/content/Context;)V
    :try_end_6b
    .catch Ljava/lang/RuntimeException; {:try_start_6b .. :try_end_6b} :catch_5

    .end local v71           #bluetooth:Lcom/android/server/BluetoothManagerService;
    .local v72, bluetooth:Lcom/android/server/BluetoothManagerService;
    :try_start_6c
    const-string v7, "bluetooth_manager"

    move-object/from16 v0, v72

    invoke-static {v7, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_6c
    .catch Ljava/lang/RuntimeException; {:try_start_6c .. :try_end_6c} :catch_62

    move-object/from16 v71, v72

    .end local v72           #bluetooth:Lcom/android/server/BluetoothManagerService;
    .restart local v71       #bluetooth:Lcom/android/server/BluetoothManagerService;
    goto/16 :goto_d

    .end local v74           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .end local v82           #consumerIr:Lcom/android/server/ConsumerIrService;
    .end local v86           #cryptState:Ljava/lang/String;
    .end local v110           #haptics:Lcom/android/server/HapticsService;
    .end local v153           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v163           #vibrator:Lcom/android/server/VibratorService;
    .end local v166           #wakeGesture:Lcom/android/server/WakeGestureService;
    .restart local v66       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v68       #atlas:Lcom/android/server/AssetAtlasService;
    .restart local v73       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v81       #consumerIr:Lcom/android/server/ConsumerIrService;
    .restart local v84       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v88       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v102       #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .restart local v109       #haptics:Lcom/android/server/HapticsService;
    .restart local v111       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v117       #location:Lcom/android/server/LocationManagerService;
    .restart local v119       #lockSettings:Lcom/android/server/LockSettingsService;
    .restart local v121       #mediaRouter:Lcom/android/server/media/MediaRouterService;
    .restart local v132       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v136       #printManager:Lcom/android/server/print/PrintManagerService;
    .restart local v150       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v152       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v154       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v162       #vibrator:Lcom/android/server/VibratorService;
    .restart local v165       #wakeGesture:Lcom/android/server/WakeGestureService;
    .restart local v167       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_6
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_4e
    const-string v7, "starting Input Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_f

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_7
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "starting Accessibility Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_10

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_8
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "making display ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_11

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_9
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "performing boot dexopt"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_12

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_a
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_4f
    const-string v7, "starting Mount Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_14

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_b
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_50
    const-string v7, "starting LockSettingsService service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_15

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_c
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_51
    const-string v7, "starting DevicePolicyService"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_16

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_d
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_52
    const-string v7, "starting StatusBarManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_17

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_e
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "starting Clipboard Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_18

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_f
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "starting NetworkManagement Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_19

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_10
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_53
    const-string v7, "starting Text Service Manager Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1a

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_11
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_54
    const-string v7, "starting NetworkStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1b

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_12
    move-exception v104

    move-object/from16 v25, v128

    .end local v128           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v25       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_55
    const-string v7, "starting NetworkPolicy Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1c

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_13
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_56
    const-string v7, "starting Wi-Fi P2pService"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1d

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_14
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_57
    const-string v7, "starting Wi-Fi Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_1e

    .end local v104           #e:Ljava/lang/Throwable;
    .restart local v105       #enableCne:I
    :cond_32
    const/16 v75, 0x0

    goto/16 :goto_1f

    .restart local v75       #cneFeature:I
    :cond_33
    :try_start_6d
    const-string v7, "SystemServer"

    const-string v9, "Connectivity Service"

    invoke-static {v7, v9}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v80, Lcom/android/server/ConnectivityService;

    move-object/from16 v0, v80

    move-object/from16 v1, v30

    move-object/from16 v2, v29

    move-object/from16 v3, v25

    invoke-direct {v0, v5, v1, v2, v3}, Lcom/android/server/ConnectivityService;-><init>(Landroid/content/Context;Landroid/os/INetworkManagementService;Landroid/net/INetworkStatsService;Landroid/net/INetworkPolicyManager;)V
    :try_end_6d
    .catch Ljava/lang/Throwable; {:try_start_6d .. :try_end_6d} :catch_15

    .end local v79           #connectivity:Lcom/android/server/ConnectivityService;
    .local v80, connectivity:Lcom/android/server/ConnectivityService;
    move-object/from16 v79, v80

    .end local v80           #connectivity:Lcom/android/server/ConnectivityService;
    .restart local v79       #connectivity:Lcom/android/server/ConnectivityService;
    goto/16 :goto_20

    .end local v75           #cneFeature:I
    .end local v138           #qcCon:Ljava/lang/Object;
    :catch_15
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "starting Connectivity Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_21

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_16
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "starting Service Discovery Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_22

    .end local v104           #e:Ljava/lang/Throwable;
    .end local v105           #enableCne:I
    :catch_17
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "starting UpdateLockService"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_23

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_18
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "making Account Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_24

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_19
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "making Content Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_25

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_1a
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_58
    const-string v7, "starting Notification Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_26

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_1b
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "starting DeviceStorageMonitor service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_27

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_1c
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_59
    const-string v7, "starting Location Manager"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_28

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_1d
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_5a
    const-string v7, "starting Country Detector"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_29

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_1e
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "starting Search Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2a

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_1f
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "starting DropBoxManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2b

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_20
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_5b
    const-string v7, "starting Wallpaper Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2c

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_21
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "starting Audio Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2d

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_22
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "starting DockObserver"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2e

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_23
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "starting WiredAccessoryManager"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_2f

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_24
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_5c
    const-string v7, "starting UsbService"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_30

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_25
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_5d
    const-string v7, "SystemServer"

    const-string v9, "Failure starting SerialService"

    move-object/from16 v0, v104

    invoke-static {v7, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_31

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_26
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "starting TwilightService"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_32

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_27
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "starting UiModeManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_33

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_28
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "SystemServer"

    const-string v9, "Failure starting Backup Service"

    move-object/from16 v0, v104

    invoke-static {v7, v9, v0}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_34

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_29
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_5e
    const-string v7, "starting AppWidget Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_35

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_2a
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "starting Recognition Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_36

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_2b
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "starting DiskStats Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_37

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_2c
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "starting SamplingProfiler Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_38

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_2d
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "starting NetworkTimeUpdate service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_39

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_2e
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_5f
    const-string v7, "starting CommonTimeManagementService service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3a

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_2f
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "starting CertBlacklister"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3b

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_30
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_60
    const-string v7, "starting DreamManagerService"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3c

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_31
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_61
    const-string v7, "starting AssetAtlasService"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3d

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_32
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "starting IdleMaintenanceService"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3e

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_33
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_62
    const-string v7, "starting Print Service"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_3f

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_34
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    :goto_63
    const-string v7, "starting MediaRouterService"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_40

    .end local v104           #e:Ljava/lang/Throwable;
    .restart local v47       #safeMode:Z
    :cond_34
    invoke-static {}, Ldalvik/system/VMRuntime;->getRuntime()Ldalvik/system/VMRuntime;

    move-result-object v7

    invoke-virtual {v7}, Ldalvik/system/VMRuntime;->startJitCompilation()V

    goto/16 :goto_41

    :catch_35
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "making Vibrator Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_42

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_36
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "making haptics Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_43

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_37
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "making Lock Settings Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_44

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_38
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "making Device Policy Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_45

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_39
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "making Notification Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_46

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_3a
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "making Window Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_47

    .end local v104           #e:Ljava/lang/Throwable;
    .restart local v78       #config:Landroid/content/res/Configuration;
    .restart local v123       #metrics:Landroid/util/DisplayMetrics;
    .restart local v164       #w:Landroid/view/WindowManager;
    :catch_3b
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "making Power Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_48

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_3c
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "making Package Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_49

    .end local v104           #e:Ljava/lang/Throwable;
    :catch_3d
    move-exception v104

    .restart local v104       #e:Ljava/lang/Throwable;
    const-string v7, "making Display Manager Service ready"

    move-object/from16 v0, p0

    move-object/from16 v1, v104

    invoke-virtual {v0, v7, v1}, Lcom/android/server/ServerThread;->reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_4a

    .end local v6           #lights:Lcom/android/server/LightsService;
    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v25           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v47           #safeMode:Z
    .end local v66           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v68           #atlas:Lcom/android/server/AssetAtlasService;
    .end local v78           #config:Landroid/content/res/Configuration;
    .end local v84           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v88           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v102           #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .end local v104           #e:Ljava/lang/Throwable;
    .end local v111           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v117           #location:Lcom/android/server/LocationManagerService;
    .end local v119           #lockSettings:Lcom/android/server/LockSettingsService;
    .end local v121           #mediaRouter:Lcom/android/server/media/MediaRouterService;
    .end local v123           #metrics:Landroid/util/DisplayMetrics;
    .end local v132           #notification:Lcom/android/server/NotificationManagerService;
    .end local v136           #printManager:Lcom/android/server/print/PrintManagerService;
    .end local v150           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v152           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v154           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v164           #w:Landroid/view/WindowManager;
    .end local v167           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v65       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v70       #battery:Lcom/android/server/BatteryService;
    .restart local v86       #cryptState:Ljava/lang/String;
    .restart local v113       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v116       #lights:Lcom/android/server/LightsService;
    .restart local v128       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v138       #qcCon:Ljava/lang/Object;
    .restart local v153       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :catch_3e
    move-exception v7

    goto/16 :goto_7

    .end local v65           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v70           #battery:Lcom/android/server/BatteryService;
    .end local v86           #cryptState:Ljava/lang/String;
    .end local v113           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v116           #lights:Lcom/android/server/LightsService;
    .end local v128           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v138           #qcCon:Ljava/lang/Object;
    .end local v153           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v6       #lights:Lcom/android/server/LightsService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v25       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v66       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v68       #atlas:Lcom/android/server/AssetAtlasService;
    .restart local v84       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v88       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v102       #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .restart local v111       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v117       #location:Lcom/android/server/LocationManagerService;
    .restart local v119       #lockSettings:Lcom/android/server/LockSettingsService;
    .restart local v122       #mediaRouter:Lcom/android/server/media/MediaRouterService;
    .restart local v132       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v136       #printManager:Lcom/android/server/print/PrintManagerService;
    .restart local v150       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v152       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v154       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v167       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_3f
    move-exception v104

    move-object/from16 v121, v122

    .end local v122           #mediaRouter:Lcom/android/server/media/MediaRouterService;
    .restart local v121       #mediaRouter:Lcom/android/server/media/MediaRouterService;
    goto/16 :goto_63

    .end local v136           #printManager:Lcom/android/server/print/PrintManagerService;
    .restart local v137       #printManager:Lcom/android/server/print/PrintManagerService;
    :catch_40
    move-exception v104

    move-object/from16 v136, v137

    .end local v137           #printManager:Lcom/android/server/print/PrintManagerService;
    .restart local v136       #printManager:Lcom/android/server/print/PrintManagerService;
    goto/16 :goto_62

    .end local v68           #atlas:Lcom/android/server/AssetAtlasService;
    .restart local v69       #atlas:Lcom/android/server/AssetAtlasService;
    :catch_41
    move-exception v104

    move-object/from16 v68, v69

    .end local v69           #atlas:Lcom/android/server/AssetAtlasService;
    .restart local v68       #atlas:Lcom/android/server/AssetAtlasService;
    goto/16 :goto_61

    .end local v102           #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .restart local v103       #dreamy:Lcom/android/server/dreams/DreamManagerService;
    :catch_42
    move-exception v104

    move-object/from16 v102, v103

    .end local v103           #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .restart local v102       #dreamy:Lcom/android/server/dreams/DreamManagerService;
    goto/16 :goto_60

    .end local v76           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v77       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    :catch_43
    move-exception v104

    move-object/from16 v76, v77

    .end local v77           #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    .restart local v76       #commonTimeMgmtService:Lcom/android/server/CommonTimeManagementService;
    goto/16 :goto_5f

    .end local v66           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v67       #appWidget:Lcom/android/server/AppWidgetService;
    :catch_44
    move-exception v104

    move-object/from16 v66, v67

    .end local v67           #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v66       #appWidget:Lcom/android/server/AppWidgetService;
    goto/16 :goto_5e

    .end local v146           #serial:Lcom/android/server/SerialService;
    .restart local v147       #serial:Lcom/android/server/SerialService;
    :catch_45
    move-exception v104

    move-object/from16 v146, v147

    .end local v147           #serial:Lcom/android/server/SerialService;
    .restart local v146       #serial:Lcom/android/server/SerialService;
    goto/16 :goto_5d

    .end local v160           #usb:Lcom/android/server/usb/UsbService;
    .restart local v161       #usb:Lcom/android/server/usb/UsbService;
    :catch_46
    move-exception v104

    move-object/from16 v160, v161

    .end local v161           #usb:Lcom/android/server/usb/UsbService;
    .restart local v160       #usb:Lcom/android/server/usb/UsbService;
    goto/16 :goto_5c

    .end local v167           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v168       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :catch_47
    move-exception v104

    move-object/from16 v167, v168

    .end local v168           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v167       #wallpaper:Lcom/android/server/WallpaperManagerService;
    goto/16 :goto_5b

    .end local v84           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v85       #countryDetector:Lcom/android/server/CountryDetectorService;
    :catch_48
    move-exception v104

    move-object/from16 v84, v85

    .end local v85           #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v84       #countryDetector:Lcom/android/server/CountryDetectorService;
    goto/16 :goto_5a

    .end local v117           #location:Lcom/android/server/LocationManagerService;
    .restart local v118       #location:Lcom/android/server/LocationManagerService;
    :catch_49
    move-exception v104

    move-object/from16 v117, v118

    .end local v118           #location:Lcom/android/server/LocationManagerService;
    .restart local v117       #location:Lcom/android/server/LocationManagerService;
    goto/16 :goto_59

    .end local v132           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v133       #notification:Lcom/android/server/NotificationManagerService;
    :catch_4a
    move-exception v104

    move-object/from16 v132, v133

    .end local v133           #notification:Lcom/android/server/NotificationManagerService;
    .restart local v132       #notification:Lcom/android/server/NotificationManagerService;
    goto/16 :goto_58

    .end local v169           #wifi:Lcom/android/server/wifi/WifiService;
    .restart local v138       #qcCon:Ljava/lang/Object;
    .restart local v170       #wifi:Lcom/android/server/wifi/WifiService;
    :catch_4b
    move-exception v104

    move-object/from16 v169, v170

    .end local v170           #wifi:Lcom/android/server/wifi/WifiService;
    .restart local v169       #wifi:Lcom/android/server/wifi/WifiService;
    goto/16 :goto_57

    .end local v171           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v172       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    :catch_4c
    move-exception v104

    move-object/from16 v171, v172

    .end local v172           #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    .restart local v171       #wifiP2p:Landroid/net/wifi/p2p/WifiP2pService;
    goto/16 :goto_56

    :catch_4d
    move-exception v104

    goto/16 :goto_55

    .end local v25           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .end local v29           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v128       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v129       #networkStats:Lcom/android/server/net/NetworkStatsService;
    :catch_4e
    move-exception v104

    move-object/from16 v29, v129

    .end local v129           #networkStats:Lcom/android/server/net/NetworkStatsService;
    .restart local v29       #networkStats:Lcom/android/server/net/NetworkStatsService;
    goto/16 :goto_54

    .end local v154           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v155       #tsms:Lcom/android/server/TextServicesManagerService;
    :catch_4f
    move-exception v104

    move-object/from16 v154, v155

    .end local v155           #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v154       #tsms:Lcom/android/server/TextServicesManagerService;
    goto/16 :goto_53

    .end local v150           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v151       #statusBar:Lcom/android/server/StatusBarManagerService;
    :catch_50
    move-exception v104

    move-object/from16 v150, v151

    .end local v151           #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v150       #statusBar:Lcom/android/server/StatusBarManagerService;
    goto/16 :goto_52

    .end local v88           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v89       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    :catch_51
    move-exception v104

    move-object/from16 v88, v89

    .end local v89           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v88       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    goto/16 :goto_51

    .end local v119           #lockSettings:Lcom/android/server/LockSettingsService;
    .restart local v120       #lockSettings:Lcom/android/server/LockSettingsService;
    :catch_52
    move-exception v104

    move-object/from16 v119, v120

    .end local v120           #lockSettings:Lcom/android/server/LockSettingsService;
    .restart local v119       #lockSettings:Lcom/android/server/LockSettingsService;
    goto/16 :goto_50

    .end local v124           #mountService:Lcom/android/server/MountService;
    .restart local v125       #mountService:Lcom/android/server/MountService;
    :catch_53
    move-exception v104

    move-object/from16 v124, v125

    .end local v125           #mountService:Lcom/android/server/MountService;
    .restart local v124       #mountService:Lcom/android/server/MountService;
    goto/16 :goto_4f

    :catch_54
    move-exception v7

    goto/16 :goto_13

    .end local v111           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v112       #imm:Lcom/android/server/InputMethodManagerService;
    :catch_55
    move-exception v104

    move-object/from16 v111, v112

    .end local v112           #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v111       #imm:Lcom/android/server/InputMethodManagerService;
    goto/16 :goto_4e

    .end local v6           #lights:Lcom/android/server/LightsService;
    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v11           #display:Lcom/android/server/display/DisplayManagerService;
    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v66           #appWidget:Lcom/android/server/AppWidgetService;
    .end local v68           #atlas:Lcom/android/server/AssetAtlasService;
    .end local v84           #countryDetector:Lcom/android/server/CountryDetectorService;
    .end local v88           #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .end local v102           #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .end local v111           #imm:Lcom/android/server/InputMethodManagerService;
    .end local v117           #location:Lcom/android/server/LocationManagerService;
    .end local v119           #lockSettings:Lcom/android/server/LockSettingsService;
    .end local v121           #mediaRouter:Lcom/android/server/media/MediaRouterService;
    .end local v132           #notification:Lcom/android/server/NotificationManagerService;
    .end local v136           #printManager:Lcom/android/server/print/PrintManagerService;
    .end local v150           #statusBar:Lcom/android/server/StatusBarManagerService;
    .end local v154           #tsms:Lcom/android/server/TextServicesManagerService;
    .end local v167           #wallpaper:Lcom/android/server/WallpaperManagerService;
    .restart local v65       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v70       #battery:Lcom/android/server/BatteryService;
    .restart local v99       #display:Lcom/android/server/display/DisplayManagerService;
    .restart local v113       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v116       #lights:Lcom/android/server/LightsService;
    :catch_56
    move-exception v104

    move-object/from16 v20, v113

    .end local v113           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v70

    .end local v70           #battery:Lcom/android/server/BatteryService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v11, v99

    .end local v99           #display:Lcom/android/server/display/DisplayManagerService;
    .restart local v11       #display:Lcom/android/server/display/DisplayManagerService;
    move-object/from16 v6, v116

    .end local v116           #lights:Lcom/android/server/LightsService;
    .restart local v6       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_4d

    .end local v6           #lights:Lcom/android/server/LightsService;
    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v65       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v70       #battery:Lcom/android/server/BatteryService;
    .restart local v113       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v116       #lights:Lcom/android/server/LightsService;
    :catch_57
    move-exception v104

    move-object/from16 v20, v113

    .end local v113           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v70

    .end local v70           #battery:Lcom/android/server/BatteryService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v6, v116

    .end local v116           #lights:Lcom/android/server/LightsService;
    .restart local v6       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_4d

    .end local v6           #lights:Lcom/android/server/LightsService;
    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v126           #msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    .end local v152           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v65       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v70       #battery:Lcom/android/server/BatteryService;
    .restart local v113       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v116       #lights:Lcom/android/server/LightsService;
    .restart local v127       #msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    .restart local v153       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :catch_58
    move-exception v104

    move-object/from16 v126, v127

    .end local v127           #msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    .restart local v126       #msimTelephonyRegistry:Lcom/android/server/MSimTelephonyRegistry;
    move-object/from16 v152, v153

    .end local v153           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v152       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v20, v113

    .end local v113           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v70

    .end local v70           #battery:Lcom/android/server/BatteryService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v6, v116

    .end local v116           #lights:Lcom/android/server/LightsService;
    .restart local v6       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_4d

    .end local v6           #lights:Lcom/android/server/LightsService;
    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v63           #accountManager:Lcom/android/server/accounts/AccountManagerService;
    .end local v152           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v64       #accountManager:Lcom/android/server/accounts/AccountManagerService;
    .restart local v65       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v70       #battery:Lcom/android/server/BatteryService;
    .restart local v86       #cryptState:Ljava/lang/String;
    .restart local v113       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v116       #lights:Lcom/android/server/LightsService;
    .restart local v153       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :catch_59
    move-exception v104

    move-object/from16 v152, v153

    .end local v153           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v152       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v20, v113

    .end local v113           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v70

    .end local v70           #battery:Lcom/android/server/BatteryService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v6, v116

    .end local v116           #lights:Lcom/android/server/LightsService;
    .restart local v6       #lights:Lcom/android/server/LightsService;
    move-object/from16 v63, v64

    .end local v64           #accountManager:Lcom/android/server/accounts/AccountManagerService;
    .restart local v63       #accountManager:Lcom/android/server/accounts/AccountManagerService;
    goto/16 :goto_4d

    .end local v6           #lights:Lcom/android/server/LightsService;
    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v73           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .end local v152           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v65       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v70       #battery:Lcom/android/server/BatteryService;
    .restart local v74       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v113       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v116       #lights:Lcom/android/server/LightsService;
    .restart local v153       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :catch_5a
    move-exception v104

    move-object/from16 v152, v153

    .end local v153           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v152       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v73, v74

    .end local v74           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v73       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    move-object/from16 v20, v113

    .end local v113           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v70

    .end local v70           #battery:Lcom/android/server/BatteryService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    move-object/from16 v6, v116

    .end local v116           #lights:Lcom/android/server/LightsService;
    .restart local v6       #lights:Lcom/android/server/LightsService;
    goto/16 :goto_4d

    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v73           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .end local v152           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v65       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v70       #battery:Lcom/android/server/BatteryService;
    .restart local v74       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v113       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v153       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :catch_5b
    move-exception v104

    move-object/from16 v152, v153

    .end local v153           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v152       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v73, v74

    .end local v74           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v73       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    move-object/from16 v20, v113

    .end local v113           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v8, v70

    .end local v70           #battery:Lcom/android/server/BatteryService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    goto/16 :goto_4d

    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v73           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .end local v152           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v65       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v74       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v113       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v153       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :catch_5c
    move-exception v104

    move-object/from16 v152, v153

    .end local v153           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v152       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v73, v74

    .end local v74           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v73       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    move-object/from16 v20, v113

    .end local v113           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    goto/16 :goto_4d

    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v73           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .end local v152           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v162           #vibrator:Lcom/android/server/VibratorService;
    .restart local v65       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v74       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v113       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v153       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v163       #vibrator:Lcom/android/server/VibratorService;
    :catch_5d
    move-exception v104

    move-object/from16 v152, v153

    .end local v153           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v152       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v73, v74

    .end local v74           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v73       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    move-object/from16 v20, v113

    .end local v113           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v162, v163

    .end local v163           #vibrator:Lcom/android/server/VibratorService;
    .restart local v162       #vibrator:Lcom/android/server/VibratorService;
    goto/16 :goto_4d

    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v73           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .end local v109           #haptics:Lcom/android/server/HapticsService;
    .end local v152           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v162           #vibrator:Lcom/android/server/VibratorService;
    .restart local v65       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v74       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v110       #haptics:Lcom/android/server/HapticsService;
    .restart local v113       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v153       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v163       #vibrator:Lcom/android/server/VibratorService;
    :catch_5e
    move-exception v104

    move-object/from16 v152, v153

    .end local v153           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v152       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v73, v74

    .end local v74           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v73       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    move-object/from16 v20, v113

    .end local v113           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v109, v110

    .end local v110           #haptics:Lcom/android/server/HapticsService;
    .restart local v109       #haptics:Lcom/android/server/HapticsService;
    move-object/from16 v162, v163

    .end local v163           #vibrator:Lcom/android/server/VibratorService;
    .restart local v162       #vibrator:Lcom/android/server/VibratorService;
    goto/16 :goto_4d

    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v73           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .end local v109           #haptics:Lcom/android/server/HapticsService;
    .end local v152           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v162           #vibrator:Lcom/android/server/VibratorService;
    .end local v165           #wakeGesture:Lcom/android/server/WakeGestureService;
    .restart local v65       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v74       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v110       #haptics:Lcom/android/server/HapticsService;
    .restart local v113       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v153       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v163       #vibrator:Lcom/android/server/VibratorService;
    .restart local v166       #wakeGesture:Lcom/android/server/WakeGestureService;
    :catch_5f
    move-exception v104

    move-object/from16 v152, v153

    .end local v153           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v152       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v73, v74

    .end local v74           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v73       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    move-object/from16 v20, v113

    .end local v113           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v109, v110

    .end local v110           #haptics:Lcom/android/server/HapticsService;
    .restart local v109       #haptics:Lcom/android/server/HapticsService;
    move-object/from16 v165, v166

    .end local v166           #wakeGesture:Lcom/android/server/WakeGestureService;
    .restart local v165       #wakeGesture:Lcom/android/server/WakeGestureService;
    move-object/from16 v162, v163

    .end local v163           #vibrator:Lcom/android/server/VibratorService;
    .restart local v162       #vibrator:Lcom/android/server/VibratorService;
    goto/16 :goto_4d

    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v73           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .end local v81           #consumerIr:Lcom/android/server/ConsumerIrService;
    .end local v109           #haptics:Lcom/android/server/HapticsService;
    .end local v152           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v162           #vibrator:Lcom/android/server/VibratorService;
    .end local v165           #wakeGesture:Lcom/android/server/WakeGestureService;
    .restart local v65       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v74       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v82       #consumerIr:Lcom/android/server/ConsumerIrService;
    .restart local v110       #haptics:Lcom/android/server/HapticsService;
    .restart local v113       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v153       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v163       #vibrator:Lcom/android/server/VibratorService;
    .restart local v166       #wakeGesture:Lcom/android/server/WakeGestureService;
    :catch_60
    move-exception v104

    move-object/from16 v81, v82

    .end local v82           #consumerIr:Lcom/android/server/ConsumerIrService;
    .restart local v81       #consumerIr:Lcom/android/server/ConsumerIrService;
    move-object/from16 v152, v153

    .end local v153           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v152       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v73, v74

    .end local v74           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v73       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    move-object/from16 v20, v113

    .end local v113           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v16, v65

    .end local v65           #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    move-object/from16 v109, v110

    .end local v110           #haptics:Lcom/android/server/HapticsService;
    .restart local v109       #haptics:Lcom/android/server/HapticsService;
    move-object/from16 v165, v166

    .end local v166           #wakeGesture:Lcom/android/server/WakeGestureService;
    .restart local v165       #wakeGesture:Lcom/android/server/WakeGestureService;
    move-object/from16 v162, v163

    .end local v163           #vibrator:Lcom/android/server/VibratorService;
    .restart local v162       #vibrator:Lcom/android/server/VibratorService;
    goto/16 :goto_4d

    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v73           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .end local v81           #consumerIr:Lcom/android/server/ConsumerIrService;
    .end local v109           #haptics:Lcom/android/server/HapticsService;
    .end local v152           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v162           #vibrator:Lcom/android/server/VibratorService;
    .end local v165           #wakeGesture:Lcom/android/server/WakeGestureService;
    .restart local v74       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v82       #consumerIr:Lcom/android/server/ConsumerIrService;
    .restart local v110       #haptics:Lcom/android/server/HapticsService;
    .restart local v113       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v153       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v163       #vibrator:Lcom/android/server/VibratorService;
    .restart local v166       #wakeGesture:Lcom/android/server/WakeGestureService;
    :catch_61
    move-exception v104

    move-object/from16 v81, v82

    .end local v82           #consumerIr:Lcom/android/server/ConsumerIrService;
    .restart local v81       #consumerIr:Lcom/android/server/ConsumerIrService;
    move-object/from16 v152, v153

    .end local v153           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v152       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v73, v74

    .end local v74           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v73       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    move-object/from16 v20, v113

    .end local v113           #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    move-object/from16 v109, v110

    .end local v110           #haptics:Lcom/android/server/HapticsService;
    .restart local v109       #haptics:Lcom/android/server/HapticsService;
    move-object/from16 v165, v166

    .end local v166           #wakeGesture:Lcom/android/server/WakeGestureService;
    .restart local v165       #wakeGesture:Lcom/android/server/WakeGestureService;
    move-object/from16 v162, v163

    .end local v163           #vibrator:Lcom/android/server/VibratorService;
    .restart local v162       #vibrator:Lcom/android/server/VibratorService;
    goto/16 :goto_4d

    .end local v71           #bluetooth:Lcom/android/server/BluetoothManagerService;
    .end local v73           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .end local v81           #consumerIr:Lcom/android/server/ConsumerIrService;
    .end local v109           #haptics:Lcom/android/server/HapticsService;
    .end local v152           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .end local v162           #vibrator:Lcom/android/server/VibratorService;
    .end local v165           #wakeGesture:Lcom/android/server/WakeGestureService;
    .restart local v72       #bluetooth:Lcom/android/server/BluetoothManagerService;
    .restart local v74       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v82       #consumerIr:Lcom/android/server/ConsumerIrService;
    .restart local v110       #haptics:Lcom/android/server/HapticsService;
    .restart local v153       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v163       #vibrator:Lcom/android/server/VibratorService;
    .restart local v166       #wakeGesture:Lcom/android/server/WakeGestureService;
    :catch_62
    move-exception v104

    move-object/from16 v81, v82

    .end local v82           #consumerIr:Lcom/android/server/ConsumerIrService;
    .restart local v81       #consumerIr:Lcom/android/server/ConsumerIrService;
    move-object/from16 v152, v153

    .end local v153           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v152       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    move-object/from16 v73, v74

    .end local v74           #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    .restart local v73       #breathinglight:Landroid/os/nubia/breathlight/BreathinglightService;
    move-object/from16 v71, v72

    .end local v72           #bluetooth:Lcom/android/server/BluetoothManagerService;
    .restart local v71       #bluetooth:Lcom/android/server/BluetoothManagerService;
    move-object/from16 v109, v110

    .end local v110           #haptics:Lcom/android/server/HapticsService;
    .restart local v109       #haptics:Lcom/android/server/HapticsService;
    move-object/from16 v165, v166

    .end local v166           #wakeGesture:Lcom/android/server/WakeGestureService;
    .restart local v165       #wakeGesture:Lcom/android/server/WakeGestureService;
    move-object/from16 v162, v163

    .end local v163           #vibrator:Lcom/android/server/VibratorService;
    .restart local v162       #vibrator:Lcom/android/server/VibratorService;
    goto/16 :goto_4d

    .end local v6           #lights:Lcom/android/server/LightsService;
    .end local v8           #battery:Lcom/android/server/BatteryService;
    .end local v16           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v20           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v63           #accountManager:Lcom/android/server/accounts/AccountManagerService;
    .end local v152           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v64       #accountManager:Lcom/android/server/accounts/AccountManagerService;
    .restart local v65       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v70       #battery:Lcom/android/server/BatteryService;
    .restart local v113       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v116       #lights:Lcom/android/server/LightsService;
    .restart local v153       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :catch_63
    move-exception v104

    move-object/from16 v63, v64

    .end local v64           #accountManager:Lcom/android/server/accounts/AccountManagerService;
    .restart local v63       #accountManager:Lcom/android/server/accounts/AccountManagerService;
    goto/16 :goto_4c

    .end local v11           #display:Lcom/android/server/display/DisplayManagerService;
    .end local v86           #cryptState:Ljava/lang/String;
    .end local v90           #disableAtlas:Z
    .end local v91           #disableBluetooth:Z
    .end local v92           #disableLocation:Z
    .end local v93           #disableMedia:Z
    .end local v94           #disableNetwork:Z
    .end local v95           #disableNonCoreServices:Z
    .end local v96           #disableStorage:Z
    .end local v97           #disableSystemUI:Z
    .end local v98           #disableTelephony:Z
    .end local v153           #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    .restart local v99       #display:Lcom/android/server/display/DisplayManagerService;
    .restart local v152       #telephonyRegistry:Lcom/android/server/TelephonyRegistry;
    :catch_64
    move-exception v104

    goto/16 :goto_4b

    .end local v114           #installer:Lcom/android/server/pm/Installer;
    .restart local v115       #installer:Lcom/android/server/pm/Installer;
    :catch_65
    move-exception v104

    move-object/from16 v114, v115

    .end local v115           #installer:Lcom/android/server/pm/Installer;
    .restart local v114       #installer:Lcom/android/server/pm/Installer;
    goto/16 :goto_4b

    .end local v65           #alarm:Lcom/android/server/AlarmManagerService;
    .end local v70           #battery:Lcom/android/server/BatteryService;
    .end local v99           #display:Lcom/android/server/display/DisplayManagerService;
    .end local v113           #inputManager:Lcom/android/server/input/InputManagerService;
    .end local v116           #lights:Lcom/android/server/LightsService;
    .restart local v6       #lights:Lcom/android/server/LightsService;
    .restart local v8       #battery:Lcom/android/server/BatteryService;
    .restart local v11       #display:Lcom/android/server/display/DisplayManagerService;
    .restart local v16       #alarm:Lcom/android/server/AlarmManagerService;
    .restart local v20       #inputManager:Lcom/android/server/input/InputManagerService;
    .restart local v66       #appWidget:Lcom/android/server/AppWidgetService;
    .restart local v68       #atlas:Lcom/android/server/AssetAtlasService;
    .restart local v84       #countryDetector:Lcom/android/server/CountryDetectorService;
    .restart local v88       #devicePolicy:Lcom/android/server/DevicePolicyManagerService;
    .restart local v90       #disableAtlas:Z
    .restart local v91       #disableBluetooth:Z
    .restart local v92       #disableLocation:Z
    .restart local v93       #disableMedia:Z
    .restart local v94       #disableNetwork:Z
    .restart local v95       #disableNonCoreServices:Z
    .restart local v96       #disableStorage:Z
    .restart local v97       #disableSystemUI:Z
    .restart local v98       #disableTelephony:Z
    .restart local v102       #dreamy:Lcom/android/server/dreams/DreamManagerService;
    .restart local v111       #imm:Lcom/android/server/InputMethodManagerService;
    .restart local v117       #location:Lcom/android/server/LocationManagerService;
    .restart local v119       #lockSettings:Lcom/android/server/LockSettingsService;
    .restart local v121       #mediaRouter:Lcom/android/server/media/MediaRouterService;
    .restart local v132       #notification:Lcom/android/server/NotificationManagerService;
    .restart local v136       #printManager:Lcom/android/server/print/PrintManagerService;
    .restart local v150       #statusBar:Lcom/android/server/StatusBarManagerService;
    .restart local v154       #tsms:Lcom/android/server/TextServicesManagerService;
    .restart local v167       #wallpaper:Lcom/android/server/WallpaperManagerService;
    :cond_35
    move-object/from16 v25, v128

    .end local v128           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v25       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    goto/16 :goto_22

    .end local v25           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v128       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    :cond_36
    move-object/from16 v25, v128

    .end local v128           #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    .restart local v25       #networkPolicy:Lcom/android/server/net/NetworkPolicyManagerService;
    goto/16 :goto_40
.end method

.method reportWtf(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3
    .parameter "msg"
    .parameter "e"

    .prologue
    const-string v0, "SystemServer"

    const-string v1, "***********************************************"

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "SystemServer"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "BOOT FAILURE "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method
