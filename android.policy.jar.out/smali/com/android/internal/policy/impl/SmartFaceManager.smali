.class public Lcom/android/internal/policy/impl/SmartFaceManager;
.super Ljava/lang/Object;
.source "SmartFaceManager.java"

# interfaces
.implements Lcom/android/internal/policy/impl/IKeyBeforeQueueingHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/policy/impl/SmartFaceManager$ExtSmartScreenLoader;,
        Lcom/android/internal/policy/impl/SmartFaceManager$EnableAutoFingerModeObserver;,
        Lcom/android/internal/policy/impl/SmartFaceManager$EnableSettingsObserver;,
        Lcom/android/internal/policy/impl/SmartFaceManager$OnSmartFaceListener;
    }
.end annotation


# static fields
.field public static final ACTION_SAMRTFACE_STATE_CHANGED:Ljava/lang/String; = "com.nubia.smartface.state.changed"

.field private static final AUTO_FINGER_MODE_FUNCTION_ENABLE:Ljava/lang/String; = "sensitive_touch"

.field private static final CLOSE_GLOVE_MODE:Ljava/lang/String; = "0"

.field private static final CLOSE_GLOVE_MODE_FOR_SMARTFACE:Ljava/lang/String; = "2"

.field private static final CLOSE_TOUCHABLE_MODE:Ljava/lang/String; = "0"

.field protected static final DEBUG:Z = false

.field static final FIELD_SINGLE_UI_MODE:Ljava/lang/String; = "single_ui_mode"

.field private static final KEEP_SCREEN_ON_TIME:J = 0x3e8L

.field private static final MAX_BRIGHTNESS:I = 0xff

.field private static final MSG_GOTO_SLEEP:I = 0xb

.field private static final MSG_PHONE_STATE_CHANGED:I = 0xa

.field private static final MSG_SMART_FACE_STATE_CHANGED:I = 0x14

.field private static final OPEN_GLOVE_MODE:Ljava/lang/String; = "3"

.field private static final OPEN_GLOVE_MODE_FOR_SMARTFACE:Ljava/lang/String; = "1"

.field private static final OPEN_TOUCHABLE_MODE:Ljava/lang/String; = "1"

.field private static final PATH_SCREEN_GLOVE_MODE:Ljava/lang/String; = "/data/tp/touch_mode"

.field private static final PATH_SCREEN_TOUCHABLE_NODE:Ljava/lang/String; = "/data/tp/hall_mode"

.field public static final SMARTFACE_DISPLAY_ENABLE:Ljava/lang/String; = "smart_face_display"

.field public static final SMARTFACE_FUNCTION_ENABLE:Ljava/lang/String; = "smart_face_function_enable"

.field public static final SMARTFACE_OPEN_UNLOCK_SCREEN:Ljava/lang/String; = "smart_face_open_unlock_screen"

.field public static final SMARTFACE_ORIDINARY_ENABLE:Ljava/lang/String; = "smart_face_ordinary"

.field public static final SMARTFACE_WINDOW_ENABLE:Ljava/lang/String; = "smart_face_window"

.field private static final SMART_FACE_FAR:I = 0x2

.field private static final SMART_FACE_NEAR:I = 0x1

.field private static final TAG:Ljava/lang/String; = "SmartFaceManager"


# instance fields
.field private callbackListener:Lcom/android/internal/policy/impl/SmartFaceManager$OnSmartFaceListener;

.field private extSmartScreen:Lcom/android/internal/policy/impl/ExtSmartScreen;

.field private filter:Landroid/content/IntentFilter;

.field final gloveNodeLock:Ljava/lang/Object;

.field private isFirstBootUp:Z

.field private isKeyguardOnWhenOpen:Z

.field private mBrightness:I

.field private mBrightnessMode:I

.field private final mBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field private mContext:Landroid/content/Context;

.field private mEnableAutoFingerModeObserver:Lcom/android/internal/policy/impl/SmartFaceManager$EnableAutoFingerModeObserver;

.field private mEnableSettingsObserver:Lcom/android/internal/policy/impl/SmartFaceManager$EnableSettingsObserver;

.field private mEnableepMode:Z

.field private mHallSensor:Landroid/hardware/Sensor;

.field private mHandler:Landroid/os/Handler;

.field private mIsAutoFingerMode:Z

.field private mIsEnableWindow:Z

.field private mIsShowing:Z

.field private mIsSingleUIEnable:Z

.field private mIsToggleOpen:Z

.field private mPhoneState:I

.field private mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

.field private final mPowerManager:Landroid/os/PowerManager;

.field private mSensorEventLister:Landroid/hardware/SensorEventListener;

.field private mShowSmartfaceWakeLock:Landroid/os/PowerManager$WakeLock;

.field private mSmartFaceView:Landroid/view/View;

.field mSmartfaceAppNameMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private mStatusBarManager:Landroid/app/StatusBarManager;

.field private mWindowManager:Landroid/view/WindowManager;

.field private needTurnOffScreen:Z

.field private sensorManager:Landroid/hardware/SensorManager;

.field final touchNodeLock:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 5
    .parameter "context"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mSmartFaceView:Landroid/view/View;

    iput v2, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPhoneState:I

    iput-boolean v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsToggleOpen:Z

    iput-boolean v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsEnableWindow:Z

    iput-boolean v2, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsSingleUIEnable:Z

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mSmartfaceAppNameMap:Ljava/util/HashMap;

    new-instance v0, Lcom/android/internal/policy/impl/SmartFaceManager$1;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/SmartFaceManager$1;-><init>(Lcom/android/internal/policy/impl/SmartFaceManager;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mSensorEventLister:Landroid/hardware/SensorEventListener;

    new-instance v0, Lcom/android/internal/policy/impl/SmartFaceManager$2;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/SmartFaceManager$2;-><init>(Lcom/android/internal/policy/impl/SmartFaceManager;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/android/internal/policy/impl/SmartFaceManager$3;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/SmartFaceManager$3;-><init>(Lcom/android/internal/policy/impl/SmartFaceManager;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    iput-boolean v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->isFirstBootUp:Z

    iput-boolean v2, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->isKeyguardOnWhenOpen:Z

    iput-boolean v2, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mEnableepMode:Z

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->touchNodeLock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->gloveNodeLock:Ljava/lang/Object;

    const-string v0, "SmartFaceManager"

    const-string v3, "SmartFaceManager"

    invoke-static {v0, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iput-object p1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    const-string v3, "window"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iput-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mWindowManager:Landroid/view/WindowManager;

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    const-string v3, "sensor"

    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->sensorManager:Landroid/hardware/SensorManager;

    const-string v0, "power"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    iput-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPowerManager:Landroid/os/PowerManager;

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPowerManager:Landroid/os/PowerManager;

    const v3, 0x10000006

    const-string v4, "show smartface"

    invoke-virtual {v0, v3, v4}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mShowSmartfaceWakeLock:Landroid/os/PowerManager$WakeLock;

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mShowSmartfaceWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0, v2}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->sensorManager:Landroid/hardware/SensorManager;

    const v3, 0x961901

    invoke-virtual {v0, v3}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mHallSensor:Landroid/hardware/Sensor;

    new-instance v0, Lcom/android/internal/policy/impl/SmartFaceManager$EnableSettingsObserver;

    iget-object v3, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, p0, v3}, Lcom/android/internal/policy/impl/SmartFaceManager$EnableSettingsObserver;-><init>(Lcom/android/internal/policy/impl/SmartFaceManager;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mEnableSettingsObserver:Lcom/android/internal/policy/impl/SmartFaceManager$EnableSettingsObserver;

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mEnableSettingsObserver:Lcom/android/internal/policy/impl/SmartFaceManager$EnableSettingsObserver;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/SmartFaceManager$EnableSettingsObserver;->observe()V

    new-instance v0, Lcom/android/internal/policy/impl/SmartFaceManager$EnableAutoFingerModeObserver;

    iget-object v3, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, p0, v3}, Lcom/android/internal/policy/impl/SmartFaceManager$EnableAutoFingerModeObserver;-><init>(Lcom/android/internal/policy/impl/SmartFaceManager;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mEnableAutoFingerModeObserver:Lcom/android/internal/policy/impl/SmartFaceManager$EnableAutoFingerModeObserver;

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mEnableAutoFingerModeObserver:Lcom/android/internal/policy/impl/SmartFaceManager$EnableAutoFingerModeObserver;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/SmartFaceManager$EnableAutoFingerModeObserver;->observe()V

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->filter:Landroid/content/IntentFilter;

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->filter:Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.PHONE_STATE"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->filter:Landroid/content/IntentFilter;

    const-string v3, "com.nubia.smartface.state.changed"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->filter:Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->filter:Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v3, "smart_face_function_enable"

    invoke-static {v0, v3, v2}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsToggleOpen:Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v3, "smart_face_window"

    invoke-static {v0, v3, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    if-eqz v0, :cond_1

    :goto_1
    iput-boolean v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsEnableWindow:Z

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->onResume()V

    return-void

    :cond_0
    move v0, v2

    goto :goto_0

    :cond_1
    move v1, v2

    goto :goto_1
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/internal/policy/impl/PhoneWindowManager;)V
    .locals 0
    .parameter "context"
    .parameter "windowManager"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/SmartFaceManager;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/internal/policy/impl/SmartFaceManager$OnSmartFaceListener;)V
    .locals 0
    .parameter "context"
    .parameter "callback"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/SmartFaceManager;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->callbackListener:Lcom/android/internal/policy/impl/SmartFaceManager$OnSmartFaceListener;

    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/policy/impl/SmartFaceManager;)Z
    .locals 1
    .parameter "x0"

    .prologue
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsToggleOpen:Z

    return v0
.end method

.method static synthetic access$002(Lcom/android/internal/policy/impl/SmartFaceManager;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsToggleOpen:Z

    return p1
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/SmartFaceManager;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->doCloseLeather()V

    return-void
.end method

.method static synthetic access$1000(Lcom/android/internal/policy/impl/SmartFaceManager;)Z
    .locals 1
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->isAutoFingerEnable()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1100(Lcom/android/internal/policy/impl/SmartFaceManager;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/SmartFaceManager;->dealGLoveNode(Z)V

    return-void
.end method

.method static synthetic access$1200(Lcom/android/internal/policy/impl/SmartFaceManager;)Z
    .locals 1
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->isSmartFaceEnable()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1300(Lcom/android/internal/policy/impl/SmartFaceManager;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/SmartFaceManager;->dealGLoveNodeForSmartFace(Z)V

    return-void
.end method

.method static synthetic access$1400(Lcom/android/internal/policy/impl/SmartFaceManager;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/SmartFaceManager;->disableScreenTouch(Z)V

    return-void
.end method

.method static synthetic access$1500(Lcom/android/internal/policy/impl/SmartFaceManager;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/SmartFaceManager;->enableGloveTouch(Z)V

    return-void
.end method

.method static synthetic access$1600(Lcom/android/internal/policy/impl/SmartFaceManager;Ljava/lang/String;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/SmartFaceManager;->writeGloveTouchForSmartFace(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1700(Lcom/android/internal/policy/impl/SmartFaceManager;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->showSmartFaceView()V

    return-void
.end method

.method static synthetic access$1800(Lcom/android/internal/policy/impl/SmartFaceManager;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->dismissSmartFaceView()V

    return-void
.end method

.method static synthetic access$1900(Lcom/android/internal/policy/impl/SmartFaceManager;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/internal/policy/impl/SmartFaceManager;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->doOpenLeather()V

    return-void
.end method

.method static synthetic access$2000(Lcom/android/internal/policy/impl/SmartFaceManager;)Z
    .locals 1
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->isSmartFaceFunEnable()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2100(Lcom/android/internal/policy/impl/SmartFaceManager;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->onStop()V

    return-void
.end method

.method static synthetic access$2200(Lcom/android/internal/policy/impl/SmartFaceManager;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->onResume()V

    return-void
.end method

.method static synthetic access$2300(Lcom/android/internal/policy/impl/SmartFaceManager;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->dismissSmartFaceMain()V

    return-void
.end method

.method static synthetic access$2402(Lcom/android/internal/policy/impl/SmartFaceManager;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsAutoFingerMode:Z

    return p1
.end method

.method static synthetic access$300(Lcom/android/internal/policy/impl/SmartFaceManager;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->handleSmartFaceViewStateChanged()V

    return-void
.end method

.method static synthetic access$400(Lcom/android/internal/policy/impl/SmartFaceManager;)Z
    .locals 1
    .parameter "x0"

    .prologue
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsEnableWindow:Z

    return v0
.end method

.method static synthetic access$402(Lcom/android/internal/policy/impl/SmartFaceManager;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsEnableWindow:Z

    return p1
.end method

.method static synthetic access$500(Lcom/android/internal/policy/impl/SmartFaceManager;)Landroid/os/Handler;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic access$600(Lcom/android/internal/policy/impl/SmartFaceManager;Ljava/lang/String;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/internal/policy/impl/SmartFaceManager;->putAppViewMap(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$700(Lcom/android/internal/policy/impl/SmartFaceManager;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->dealScreenNodeWhenScreenOn()V

    return-void
.end method

.method static synthetic access$800(Lcom/android/internal/policy/impl/SmartFaceManager;Z)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/SmartFaceManager;->setSmartFaceDisplayFlag(Z)V

    return-void
.end method

.method static synthetic access$900(Lcom/android/internal/policy/impl/SmartFaceManager;)Z
    .locals 1
    .parameter "x0"

    .prologue
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->isFirstBootUp:Z

    return v0
.end method

.method static synthetic access$902(Lcom/android/internal/policy/impl/SmartFaceManager;Z)Z
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput-boolean p1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->isFirstBootUp:Z

    return p1
.end method

.method private adjustBrightness(Z)V
    .locals 2
    .parameter "near"

    .prologue
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mEnableepMode:Z

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    if-eqz p1, :cond_2

    iget v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mBrightnessMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/SmartFaceManager;->setBrightnessMode(I)V

    :cond_1
    const/16 v0, 0x28

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/SmartFaceManager;->setSysScreenBrightness(I)V

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->restoreBrightness()V

    goto :goto_0
.end method

.method private adjustStatusBarLocked()V
    .locals 3

    .prologue
    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mStatusBarManager:Landroid/app/StatusBarManager;

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    const-string v2, "statusbar"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/StatusBarManager;

    iput-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mStatusBarManager:Landroid/app/StatusBarManager;

    :cond_0
    const/4 v0, 0x0

    .local v0, flags:I
    iget-boolean v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsShowing:Z

    if-eqz v1, :cond_1

    const/high16 v1, 0x1

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/PhoneWindowManager;->isKeyguardLocked()Z

    move-result v1

    if-eqz v1, :cond_1

    const/high16 v1, 0x100

    or-int/2addr v0, v1

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/PhoneWindowManager;->isKeyguardSecure()Z

    move-result v1

    if-eqz v1, :cond_1

    const/high16 v1, 0x8

    or-int/2addr v0, v1

    :cond_1
    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mStatusBarManager:Landroid/app/StatusBarManager;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mStatusBarManager:Landroid/app/StatusBarManager;

    invoke-virtual {v1, v0}, Landroid/app/StatusBarManager;->disable(I)V

    :cond_2
    return-void
.end method

.method private awaken()V
    .locals 5

    .prologue
    const/16 v3, 0xb

    const-string v1, "SmartFaceManager"

    const-string v2, "smartface awaken"

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPowerManager:Landroid/os/PowerManager;

    invoke-virtual {v1}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v0

    .local v0, isScreenOn:Z
    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v3}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, v3}, Landroid/os/Handler;->removeMessages(I)V

    :cond_0
    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPowerManager:Landroid/os/PowerManager;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/PowerManager;->userActivity(JZ)V

    :goto_0
    return-void

    :cond_1
    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mShowSmartfaceWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->acquire()V

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mShowSmartfaceWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    goto :goto_0
.end method

.method private cleanNotification()V
    .locals 2

    .prologue
    const/4 v0, 0x1

    .local v0, currentKeyguardOnWhenClose:Z
    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/PhoneWindowManager;->isKeyguardLocked()Z

    move-result v0

    :cond_0
    if-nez v0, :cond_1

    iget-boolean v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->isKeyguardOnWhenOpen:Z

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->extSmartScreen:Lcom/android/internal/policy/impl/ExtSmartScreen;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->extSmartScreen:Lcom/android/internal/policy/impl/ExtSmartScreen;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/ExtSmartScreen;->reset()V

    :cond_1
    return-void
.end method

.method private createSmartFaceView()V
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->extSmartScreen:Lcom/android/internal/policy/impl/ExtSmartScreen;

    if-nez v0, :cond_0

    const-string v0, "SmartFaceManager"

    const-string v1, "createSmartFaceView"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/android/internal/policy/impl/SmartFaceManager$ExtSmartScreenLoader;->getSmartScreen(Landroid/content/Context;)Lcom/android/internal/policy/impl/ExtSmartScreen;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->extSmartScreen:Lcom/android/internal/policy/impl/ExtSmartScreen;

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->extSmartScreen:Lcom/android/internal/policy/impl/ExtSmartScreen;

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->extSmartScreen:Lcom/android/internal/policy/impl/ExtSmartScreen;

    new-instance v1, Lcom/android/internal/policy/impl/SmartFaceManager$11;

    invoke-direct {v1, p0}, Lcom/android/internal/policy/impl/SmartFaceManager$11;-><init>(Lcom/android/internal/policy/impl/SmartFaceManager;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/ExtSmartScreen;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->extSmartScreen:Lcom/android/internal/policy/impl/ExtSmartScreen;

    new-instance v1, Lcom/android/internal/policy/impl/SmartFaceManager$12;

    invoke-direct {v1, p0}, Lcom/android/internal/policy/impl/SmartFaceManager$12;-><init>(Lcom/android/internal/policy/impl/SmartFaceManager;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/ExtSmartScreen;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    goto :goto_0
.end method

.method private dealGLoveNode(Z)V
    .locals 2
    .parameter "enable"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/internal/policy/impl/SmartFaceManager$7;

    invoke-direct {v1, p0, p1}, Lcom/android/internal/policy/impl/SmartFaceManager$7;-><init>(Lcom/android/internal/policy/impl/SmartFaceManager;Z)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private dealGLoveNodeForSmartFace(Z)V
    .locals 2
    .parameter "enable"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/internal/policy/impl/SmartFaceManager$8;

    invoke-direct {v1, p0, p1}, Lcom/android/internal/policy/impl/SmartFaceManager$8;-><init>(Lcom/android/internal/policy/impl/SmartFaceManager;Z)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private dealScreenNode(Z)V
    .locals 2
    .parameter "enable"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/internal/policy/impl/SmartFaceManager$6;

    invoke-direct {v1, p0, p1}, Lcom/android/internal/policy/impl/SmartFaceManager$6;-><init>(Lcom/android/internal/policy/impl/SmartFaceManager;Z)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private dealScreenNodeWhenScreenOn()V
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/internal/policy/impl/SmartFaceManager$5;

    invoke-direct {v1, p0}, Lcom/android/internal/policy/impl/SmartFaceManager$5;-><init>(Lcom/android/internal/policy/impl/SmartFaceManager;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private dealSingleUI(Z)V
    .locals 4
    .parameter "enable"

    .prologue
    const/4 v3, -0x2

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsSingleUIEnable:Z

    if-nez v0, :cond_0

    :goto_0
    return-void

    :cond_0
    if-nez p1, :cond_1

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "single_ui_mode"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "single_ui_mode"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2, v3}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    goto :goto_0
.end method

.method private disableScreenTouch(Z)V
    .locals 8
    .parameter "enabled"

    .prologue
    iget-object v5, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->touchNodeLock:Ljava/lang/Object;

    monitor-enter v5

    :try_start_0
    new-instance v1, Ljava/io/File;

    const-string v4, "/data/tp/hall_mode"

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v1, file:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    return-void

    :cond_0
    const/4 v2, 0x0

    .local v2, writer:Ljava/io/FileWriter;
    :try_start_1
    new-instance v3, Ljava/io/FileWriter;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v4}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4

    .end local v2           #writer:Ljava/io/FileWriter;
    .local v3, writer:Ljava/io/FileWriter;
    if-eqz p1, :cond_2

    :try_start_2
    const-string v4, "1"

    invoke-virtual {v3, v4}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    :goto_1
    invoke-virtual {v3}, Ljava/io/FileWriter;->flush()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    if-eqz v3, :cond_4

    :try_start_3
    invoke-virtual {v3}, Ljava/io/FileWriter;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    move-object v2, v3

    .end local v3           #writer:Ljava/io/FileWriter;
    .restart local v2       #writer:Ljava/io/FileWriter;
    :cond_1
    :goto_2
    :try_start_4
    monitor-exit v5

    goto :goto_0

    .end local v1           #file:Ljava/io/File;
    .end local v2           #writer:Ljava/io/FileWriter;
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v4

    .restart local v1       #file:Ljava/io/File;
    .restart local v3       #writer:Ljava/io/FileWriter;
    :cond_2
    :try_start_5
    const-string v4, "0"

    invoke-virtual {v3, v4}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    move-object v2, v3

    .end local v3           #writer:Ljava/io/FileWriter;
    .local v0, e:Ljava/io/IOException;
    .restart local v2       #writer:Ljava/io/FileWriter;
    :goto_3
    :try_start_6
    const-string v4, "SmartFaceManager"

    const-string v6, "disableScreenTouch IOException"

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    if-eqz v2, :cond_1

    :try_start_7
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1

    goto :goto_2

    :catch_1
    move-exception v0

    :try_start_8
    const-string v4, "SmartFaceManager"

    const-string v6, "disableScreenTouch close IOException"

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .end local v0           #e:Ljava/io/IOException;
    .end local v2           #writer:Ljava/io/FileWriter;
    .restart local v3       #writer:Ljava/io/FileWriter;
    :catch_2
    move-exception v0

    .restart local v0       #e:Ljava/io/IOException;
    const-string v4, "SmartFaceManager"

    const-string v6, "disableScreenTouch close IOException"

    invoke-static {v4, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    move-object v2, v3

    .end local v3           #writer:Ljava/io/FileWriter;
    .restart local v2       #writer:Ljava/io/FileWriter;
    goto :goto_2

    .end local v0           #e:Ljava/io/IOException;
    :catchall_1
    move-exception v4

    :goto_4
    if-eqz v2, :cond_3

    :try_start_9
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3

    :cond_3
    :goto_5
    :try_start_a
    throw v4

    :catch_3
    move-exception v0

    .restart local v0       #e:Ljava/io/IOException;
    const-string v6, "SmartFaceManager"

    const-string v7, "disableScreenTouch close IOException"

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto :goto_5

    .end local v0           #e:Ljava/io/IOException;
    .end local v2           #writer:Ljava/io/FileWriter;
    .restart local v3       #writer:Ljava/io/FileWriter;
    :catchall_2
    move-exception v4

    move-object v2, v3

    .end local v3           #writer:Ljava/io/FileWriter;
    .restart local v2       #writer:Ljava/io/FileWriter;
    goto :goto_4

    :catch_4
    move-exception v0

    goto :goto_3

    .end local v2           #writer:Ljava/io/FileWriter;
    .restart local v3       #writer:Ljava/io/FileWriter;
    :cond_4
    move-object v2, v3

    .end local v3           #writer:Ljava/io/FileWriter;
    .restart local v2       #writer:Ljava/io/FileWriter;
    goto :goto_2
.end method

.method private disableSmartSensor(Landroid/hardware/SensorManager;Landroid/hardware/SensorEventListener;)V
    .locals 0
    .parameter "sm"
    .parameter "listener"

    .prologue
    invoke-virtual {p1, p2}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    return-void
.end method

.method private dismissSmartFaceMain()V
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/internal/policy/impl/SmartFaceManager$10;

    invoke-direct {v1, p0}, Lcom/android/internal/policy/impl/SmartFaceManager$10;-><init>(Lcom/android/internal/policy/impl/SmartFaceManager;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private dismissSmartFaceView()V
    .locals 2

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->createSmartFaceView()V

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->extSmartScreen:Lcom/android/internal/policy/impl/ExtSmartScreen;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsShowing:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mWindowManager:Landroid/view/WindowManager;

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->extSmartScreen:Lcom/android/internal/policy/impl/ExtSmartScreen;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsShowing:Z

    :cond_0
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->adjustStatusBarLocked()V

    return-void
.end method

.method private doCloseLeather()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->needTurnOffScreen:Z

    iget v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPhoneState:I

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->isOtherSmartViewShow()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsEnableWindow:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->showSmartFaceMain()V

    invoke-direct {p0, v3}, Lcom/android/internal/policy/impl/SmartFaceManager;->setSmartFaceDisplayFlagWallper(Z)V

    :cond_0
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->triggerPhoneWindowNear()V

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsEnableWindow:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "smart_face_display"

    const/4 v2, -0x2

    invoke-static {v0, v1, v3, v2}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    invoke-direct {p0, v3}, Lcom/android/internal/policy/impl/SmartFaceManager;->dealGLoveNodeForSmartFace(Z)V

    :goto_0
    invoke-direct {p0, v3}, Lcom/android/internal/policy/impl/SmartFaceManager;->dealScreenNode(Z)V

    return-void

    :cond_1
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/SmartFaceManager;->dealGLoveNodeForSmartFace(Z)V

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->goToSleep()V

    goto :goto_0
.end method

.method private doOpenLeather()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->awaken()V

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsEnableWindow:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->dismissSmartFaceMain()V

    invoke-direct {p0, v3}, Lcom/android/internal/policy/impl/SmartFaceManager;->setSmartFaceDisplayFlagWallper(Z)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "smart_face_display"

    const/4 v2, -0x2

    invoke-static {v0, v1, v3, v2}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    :cond_0
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->trrigerPhoneWindowFar()V

    invoke-direct {p0, v3}, Lcom/android/internal/policy/impl/SmartFaceManager;->dealGLoveNodeForSmartFace(Z)V

    invoke-direct {p0, v3}, Lcom/android/internal/policy/impl/SmartFaceManager;->dealScreenNode(Z)V

    return-void
.end method

.method private enableGloveTouch(Z)V
    .locals 8
    .parameter "enabled"

    .prologue
    iget-object v5, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->gloveNodeLock:Ljava/lang/Object;

    monitor-enter v5

    :try_start_0
    new-instance v1, Ljava/io/File;

    const-string v4, "/data/tp/touch_mode"

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v1, file:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    return-void

    :cond_0
    const/4 v2, 0x0

    .local v2, writer:Ljava/io/FileWriter;
    :try_start_1
    new-instance v3, Ljava/io/FileWriter;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v4}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_4

    .end local v2           #writer:Ljava/io/FileWriter;
    .local v3, writer:Ljava/io/FileWriter;
    if-eqz p1, :cond_2

    :try_start_2
    const-string v4, "3"

    invoke-virtual {v3, v4}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    :goto_1
    invoke-virtual {v3}, Ljava/io/FileWriter;->flush()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    if-eqz v3, :cond_4

    :try_start_3
    invoke-virtual {v3}, Ljava/io/FileWriter;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    move-object v2, v3

    .end local v3           #writer:Ljava/io/FileWriter;
    .restart local v2       #writer:Ljava/io/FileWriter;
    :cond_1
    :goto_2
    :try_start_4
    monitor-exit v5

    goto :goto_0

    .end local v1           #file:Ljava/io/File;
    .end local v2           #writer:Ljava/io/FileWriter;
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v4

    .restart local v1       #file:Ljava/io/File;
    .restart local v3       #writer:Ljava/io/FileWriter;
    :cond_2
    :try_start_5
    const-string v4, "0"

    invoke-virtual {v3, v4}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    move-object v2, v3

    .end local v3           #writer:Ljava/io/FileWriter;
    .local v0, e:Ljava/io/IOException;
    .restart local v2       #writer:Ljava/io/FileWriter;
    :goto_3
    :try_start_6
    const-string v4, "SmartFaceManager"

    const-string v6, "enableGloveTouch IOException"

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    if-eqz v2, :cond_1

    :try_start_7
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1

    goto :goto_2

    :catch_1
    move-exception v0

    :try_start_8
    const-string v4, "SmartFaceManager"

    const-string v6, "enableGloveTouch close IOException"

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .end local v0           #e:Ljava/io/IOException;
    .end local v2           #writer:Ljava/io/FileWriter;
    .restart local v3       #writer:Ljava/io/FileWriter;
    :catch_2
    move-exception v0

    .restart local v0       #e:Ljava/io/IOException;
    const-string v4, "SmartFaceManager"

    const-string v6, "enableGloveTouch close IOException"

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    move-object v2, v3

    .end local v3           #writer:Ljava/io/FileWriter;
    .restart local v2       #writer:Ljava/io/FileWriter;
    goto :goto_2

    .end local v0           #e:Ljava/io/IOException;
    :catchall_1
    move-exception v4

    :goto_4
    if-eqz v2, :cond_3

    :try_start_9
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3

    :cond_3
    :goto_5
    :try_start_a
    throw v4

    :catch_3
    move-exception v0

    .restart local v0       #e:Ljava/io/IOException;
    const-string v6, "SmartFaceManager"

    const-string v7, "enableGloveTouch close IOException"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto :goto_5

    .end local v0           #e:Ljava/io/IOException;
    .end local v2           #writer:Ljava/io/FileWriter;
    .restart local v3       #writer:Ljava/io/FileWriter;
    :catchall_2
    move-exception v4

    move-object v2, v3

    .end local v3           #writer:Ljava/io/FileWriter;
    .restart local v2       #writer:Ljava/io/FileWriter;
    goto :goto_4

    :catch_4
    move-exception v0

    goto :goto_3

    .end local v2           #writer:Ljava/io/FileWriter;
    .restart local v3       #writer:Ljava/io/FileWriter;
    :cond_4
    move-object v2, v3

    .end local v3           #writer:Ljava/io/FileWriter;
    .restart local v2       #writer:Ljava/io/FileWriter;
    goto :goto_2
.end method

.method private enableSmartSensor(Landroid/hardware/SensorManager;Landroid/hardware/Sensor;Landroid/hardware/SensorEventListener;)V
    .locals 1
    .parameter "sm"
    .parameter "sensor"
    .parameter "listener"

    .prologue
    const/4 v0, 0x2

    invoke-virtual {p1, p3, p2, v0}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    return-void
.end method

.method private getBrightnessMode()I
    .locals 4

    .prologue
    const/4 v0, 0x1

    .local v0, brightnessMode:I
    :try_start_0
    iget-object v2, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "screen_brightness_mode"

    invoke-static {v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :goto_0
    return v0

    :catch_0
    move-exception v1

    .local v1, e:Ljava/lang/Exception;
    const-string v2, "SmartFaceManager"

    const-string v3, "get brightness mode failed"

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private getScreenNodeModeValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 12
    .parameter "filepath"

    .prologue
    iget-object v9, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->touchNodeLock:Ljava/lang/Object;

    monitor-enter v9

    :try_start_0
    new-instance v4, Ljava/io/File;

    invoke-direct {v4, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v4, file:Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_0

    const-string v7, ""

    monitor-exit v9
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    return-object v7

    :cond_0
    const/4 v0, 0x0

    .local v0, breader:Ljava/io/BufferedReader;
    :try_start_1
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/FileReader;

    invoke-direct {v8, v4}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    invoke-direct {v1, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .end local v0           #breader:Ljava/io/BufferedReader;
    .local v1, breader:Ljava/io/BufferedReader;
    :try_start_2
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    .local v6, str:Ljava/lang/String;
    if-eqz v6, :cond_2

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v5

    .local v5, length_str:I
    add-int/lit8 v8, v5, -0x1

    invoke-virtual {v6, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_5

    move-result-object v7

    .local v7, strnew:Ljava/lang/String;
    if-eqz v1, :cond_1

    :try_start_3
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    :cond_1
    :goto_1
    :try_start_4
    monitor-exit v9

    goto :goto_0

    .end local v1           #breader:Ljava/io/BufferedReader;
    .end local v4           #file:Ljava/io/File;
    .end local v5           #length_str:I
    .end local v6           #str:Ljava/lang/String;
    .end local v7           #strnew:Ljava/lang/String;
    :catchall_0
    move-exception v8

    monitor-exit v9
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v8

    .restart local v1       #breader:Ljava/io/BufferedReader;
    .restart local v4       #file:Ljava/io/File;
    .restart local v5       #length_str:I
    .restart local v6       #str:Ljava/lang/String;
    .restart local v7       #strnew:Ljava/lang/String;
    :catch_0
    move-exception v3

    .local v3, e2:Ljava/lang/Exception;
    :try_start_5
    const-string v8, "SmartFaceManager"

    const-string v10, "getScreenNodeModeValue close IOException"

    invoke-static {v8, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .end local v3           #e2:Ljava/lang/Exception;
    .end local v5           #length_str:I
    .end local v7           #strnew:Ljava/lang/String;
    :cond_2
    if-eqz v1, :cond_5

    :try_start_6
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    move-object v0, v1

    .end local v1           #breader:Ljava/io/BufferedReader;
    .end local v6           #str:Ljava/lang/String;
    .restart local v0       #breader:Ljava/io/BufferedReader;
    :cond_3
    :goto_2
    :try_start_7
    const-string v7, ""

    monitor-exit v9

    goto :goto_0

    .end local v0           #breader:Ljava/io/BufferedReader;
    .restart local v1       #breader:Ljava/io/BufferedReader;
    .restart local v6       #str:Ljava/lang/String;
    :catch_1
    move-exception v3

    .restart local v3       #e2:Ljava/lang/Exception;
    const-string v8, "SmartFaceManager"

    const-string v10, "getScreenNodeModeValue close IOException"

    invoke-static {v8, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move-object v0, v1

    .end local v1           #breader:Ljava/io/BufferedReader;
    .restart local v0       #breader:Ljava/io/BufferedReader;
    goto :goto_2

    .end local v3           #e2:Ljava/lang/Exception;
    .end local v6           #str:Ljava/lang/String;
    :catch_2
    move-exception v2

    .local v2, e:Ljava/io/IOException;
    :goto_3
    :try_start_8
    const-string v8, "SmartFaceManager"

    const-string v10, "getScreenNodeModeValue IOException"

    invoke-static {v8, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    if-eqz v0, :cond_3

    :try_start_9
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3

    goto :goto_2

    :catch_3
    move-exception v3

    .restart local v3       #e2:Ljava/lang/Exception;
    :try_start_a
    const-string v8, "SmartFaceManager"

    const-string v10, "getScreenNodeModeValue close IOException"

    invoke-static {v8, v10}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto :goto_2

    .end local v2           #e:Ljava/io/IOException;
    .end local v3           #e2:Ljava/lang/Exception;
    :catchall_1
    move-exception v8

    :goto_4
    if-eqz v0, :cond_4

    :try_start_b
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_4

    :cond_4
    :goto_5
    :try_start_c
    throw v8

    :catch_4
    move-exception v3

    .restart local v3       #e2:Ljava/lang/Exception;
    const-string v10, "SmartFaceManager"

    const-string v11, "getScreenNodeModeValue close IOException"

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto :goto_5

    .end local v0           #breader:Ljava/io/BufferedReader;
    .end local v3           #e2:Ljava/lang/Exception;
    .restart local v1       #breader:Ljava/io/BufferedReader;
    :catchall_2
    move-exception v8

    move-object v0, v1

    .end local v1           #breader:Ljava/io/BufferedReader;
    .restart local v0       #breader:Ljava/io/BufferedReader;
    goto :goto_4

    .end local v0           #breader:Ljava/io/BufferedReader;
    .restart local v1       #breader:Ljava/io/BufferedReader;
    :catch_5
    move-exception v2

    move-object v0, v1

    .end local v1           #breader:Ljava/io/BufferedReader;
    .restart local v0       #breader:Ljava/io/BufferedReader;
    goto :goto_3

    .end local v0           #breader:Ljava/io/BufferedReader;
    .restart local v1       #breader:Ljava/io/BufferedReader;
    .restart local v6       #str:Ljava/lang/String;
    :cond_5
    move-object v0, v1

    .end local v1           #breader:Ljava/io/BufferedReader;
    .restart local v0       #breader:Ljava/io/BufferedReader;
    goto :goto_2
.end method

.method private getSysScreenBrightness()I
    .locals 4

    .prologue
    const/16 v1, 0xff

    .local v1, screenBrightness:I
    :try_start_0
    iget-object v2, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "screen_brightness"

    invoke-static {v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    :goto_0
    return v1

    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    const-string v2, "SmartFaceManager"

    const-string v3, "get system brightness failed"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private goToSleep()V
    .locals 5

    .prologue
    const/16 v4, 0xb

    const-wide/16 v0, 0x3e8

    .local v0, delay:J
    iget-boolean v3, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsEnableWindow:Z

    if-nez v3, :cond_0

    const-wide/16 v0, 0x0

    :cond_0
    iget-object v3, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPowerManager:Landroid/os/PowerManager;

    invoke-virtual {v3}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v2

    .local v2, isScreenOn:Z
    iget-object v3, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, v4}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, v4}, Landroid/os/Handler;->removeMessages(I)V

    :cond_1
    if-eqz v2, :cond_2

    iget-object v3, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mHandler:Landroid/os/Handler;

    invoke-virtual {v3, v4, v0, v1}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :cond_2
    return-void
.end method

.method private handleSmartFaceViewStateChanged()V
    .locals 1

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->isOtherSmartViewShow()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->dismissSmartFaceMain()V

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->isSmartFaceEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->needTurnOffScreen:Z

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->isSmartFaceEnable()Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->needTurnOffScreen:Z

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->showSmartFaceMain()V

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->dismissSmartFaceMain()V

    goto :goto_0
.end method

.method private isAutoFingerEnable()Z
    .locals 3

    .prologue
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "sensitive_touch"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private isOtherSmartViewShow()Z
    .locals 7

    .prologue
    const/4 v2, 0x0

    .local v2, result:Z
    iget-object v4, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mSmartfaceAppNameMap:Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, iterator:Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .local v1, key:Ljava/lang/Object;
    iget-object v4, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mSmartfaceAppNameMap:Ljava/util/HashMap;

    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mSmartfaceAppNameMap:Ljava/util/HashMap;

    invoke-virtual {v4, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    .local v3, temp:Z
    if-nez v2, :cond_1

    if-eqz v3, :cond_2

    :cond_1
    const/4 v2, 0x1

    :goto_1
    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    goto :goto_1

    .end local v1           #key:Ljava/lang/Object;
    .end local v3           #temp:Z
    :cond_3
    const-string v4, "SmartFaceManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " received isOtherSmartViewShow result ="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2
.end method

.method private isSleepMode()Z
    .locals 2

    .prologue
    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lztemt/profilehelper/ProfileHelper;->getInstance(Landroid/content/Context;)Lztemt/profilehelper/ProfileHelper;

    move-result-object v0

    .local v0, profile:Lztemt/profilehelper/ProfileHelper;
    if-eqz v0, :cond_0

    sget-object v1, Lztemt/profilehelper/ProfileHelper$Scenario;->SLEEP:Lztemt/profilehelper/ProfileHelper$Scenario;

    invoke-virtual {v0, v1}, Lztemt/profilehelper/ProfileHelper;->getProfileActive(Lztemt/profilehelper/ProfileHelper$Scenario;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private isSmartFaceEnable()Z
    .locals 4

    .prologue
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "smart_face_display"

    const/4 v3, -0x2

    invoke-static {v1, v2, v0, v3}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private isSmartFaceFunEnable()Z
    .locals 4

    .prologue
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "smart_face_function_enable"

    const/4 v3, -0x2

    invoke-static {v1, v2, v0, v3}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private onResume()V
    .locals 3

    .prologue
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsToggleOpen:Z

    if-nez v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->filter:Landroid/content/IntentFilter;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    iget-object v2, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->filter:Landroid/content/IntentFilter;

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :cond_2
    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->sensorManager:Landroid/hardware/SensorManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mHallSensor:Landroid/hardware/Sensor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mSensorEventLister:Landroid/hardware/SensorEventListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mHallSensor:Landroid/hardware/Sensor;

    iget-object v2, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mSensorEventLister:Landroid/hardware/SensorEventListener;

    invoke-direct {p0, v0, v1, v2}, Lcom/android/internal/policy/impl/SmartFaceManager;->enableSmartSensor(Landroid/hardware/SensorManager;Landroid/hardware/Sensor;Landroid/hardware/SensorEventListener;)V

    goto :goto_0
.end method

.method private onStop()V
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    :cond_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->sensorManager:Landroid/hardware/SensorManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mSensorEventLister:Landroid/hardware/SensorEventListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->sensorManager:Landroid/hardware/SensorManager;

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mSensorEventLister:Landroid/hardware/SensorEventListener;

    invoke-direct {p0, v0, v1}, Lcom/android/internal/policy/impl/SmartFaceManager;->disableSmartSensor(Landroid/hardware/SensorManager;Landroid/hardware/SensorEventListener;)V

    :cond_1
    return-void
.end method

.method private putAppViewMap(Ljava/lang/String;Z)V
    .locals 2
    .parameter "pkgName"
    .parameter "show"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mSmartfaceAppNameMap:Ljava/util/HashMap;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private recordKeyguardStatus()V
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/PhoneWindowManager;->isKeyguardLocked()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->isKeyguardOnWhenOpen:Z

    :cond_0
    return-void
.end method

.method private restoreBrightness()V
    .locals 1

    .prologue
    iget v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mBrightnessMode:I

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/SmartFaceManager;->setBrightnessMode(I)V

    iget v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mBrightness:I

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/SmartFaceManager;->setSysScreenBrightness(I)V

    const/16 v0, -0xff

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/SmartFaceManager;->setSmartFaceBrightness(I)V

    return-void
.end method

.method private setBrightnessMode(I)V
    .locals 3
    .parameter "brightness"

    .prologue
    :try_start_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "screen_brightness_mode"

    invoke-static {v1, v2, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    const-string v1, "SmartFaceManager"

    const-string v2, "setBrightnessMode mode failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private setSmartFaceBrightness(I)V
    .locals 3
    .parameter "brightness"

    .prologue
    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->extSmartScreen:Lcom/android/internal/policy/impl/ExtSmartScreen;

    if-nez v1, :cond_0

    :goto_0
    return-void

    :cond_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->extSmartScreen:Lcom/android/internal/policy/impl/ExtSmartScreen;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/ExtSmartScreen;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager$LayoutParams;

    .local v0, lp:Landroid/view/WindowManager$LayoutParams;
    int-to-float v1, p1

    const/high16 v2, 0x437f

    div-float/2addr v1, v2

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->buttonBrightness:F

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->extSmartScreen:Lcom/android/internal/policy/impl/ExtSmartScreen;

    invoke-virtual {v1, v0}, Lcom/android/internal/policy/impl/ExtSmartScreen;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method

.method private setSmartFaceDisplayFlag(Z)V
    .locals 2
    .parameter "enable"

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->updateSingleUIFunction()V

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/SmartFaceManager;->dealSingleUI(Z)V

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->updateSleepModeState()V

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->cleanNotification()V

    invoke-direct {p0, v1}, Lcom/android/internal/policy/impl/SmartFaceManager;->adjustBrightness(Z)V

    :goto_0
    return-void

    :cond_0
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->recordKeyguardStatus()V

    invoke-direct {p0, v1}, Lcom/android/internal/policy/impl/SmartFaceManager;->dealSingleUI(Z)V

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/SmartFaceManager;->adjustBrightness(Z)V

    goto :goto_0
.end method

.method private setSmartFaceDisplayFlagWallper(Z)V
    .locals 2
    .parameter "enable"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/internal/policy/impl/SmartFaceManager$4;

    invoke-direct {v1, p0, p1}, Lcom/android/internal/policy/impl/SmartFaceManager$4;-><init>(Lcom/android/internal/policy/impl/SmartFaceManager;Z)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private setSysScreenBrightness(I)V
    .locals 5
    .parameter "brightness"

    .prologue
    :try_start_0
    iget-object v3, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .local v1, resolver:Landroid/content/ContentResolver;
    const-string v3, "screen_brightness"

    invoke-static {v3}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .local v2, uri:Landroid/net/Uri;
    const-string v3, "screen_brightness"

    invoke-static {v1, v3, p1}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .end local v1           #resolver:Landroid/content/ContentResolver;
    .end local v2           #uri:Landroid/net/Uri;
    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, e:Ljava/lang/Exception;
    const-string v3, "SmartFaceManager"

    const-string v4, "setSysScreenBrightness  failed"

    invoke-static {v3, v4, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method private showSmartFaceMain()V
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/android/internal/policy/impl/SmartFaceManager$9;

    invoke-direct {v1, p0}, Lcom/android/internal/policy/impl/SmartFaceManager$9;-><init>(Lcom/android/internal/policy/impl/SmartFaceManager;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->goToSleep()V

    return-void
.end method

.method private showSmartFaceView()V
    .locals 3

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->createSmartFaceView()V

    iget-boolean v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsShowing:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->extSmartScreen:Lcom/android/internal/policy/impl/ExtSmartScreen;

    if-nez v1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v0}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    .local v0, lp:Landroid/view/WindowManager$LayoutParams;
    const/16 v1, 0x7ea

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    const/4 v1, -0x3

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->format:I

    const v1, 0x100800

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    iget v1, v0, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    or-int/lit8 v1, v1, 0x10

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->extSmartScreen:Lcom/android/internal/policy/impl/ExtSmartScreen;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/ExtSmartScreen;->isShown()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mWindowManager:Landroid/view/WindowManager;

    iget-object v2, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->extSmartScreen:Lcom/android/internal/policy/impl/ExtSmartScreen;

    invoke-interface {v1, v2, v0}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsShowing:Z

    :cond_2
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->adjustStatusBarLocked()V

    goto :goto_0
.end method

.method private triggerPhoneWindowNear()V
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/PhoneWindowManager;->updateRotation(Z)V

    return-void
.end method

.method private trrigerPhoneWindowFar()V
    .locals 4

    .prologue
    const/4 v0, 0x1

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "smart_face_open_unlock_screen"

    const/4 v3, -0x2

    invoke-static {v1, v2, v0, v3}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v1

    if-eqz v1, :cond_1

    .local v0, dismissWhenLocked:Z
    :goto_0
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/PhoneWindowManager;->isKeyguardLocked()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/PhoneWindowManager;->isKeyguardSecure()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/PhoneWindowManager;->dismissKeyguardLw()V

    :cond_0
    return-void

    .end local v0           #dismissWhenLocked:Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private updateSingleUIFunction()V
    .locals 4

    .prologue
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "single_ui_mode"

    const/4 v3, -0x2

    invoke-static {v1, v2, v0, v3}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    iput-boolean v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mIsSingleUIEnable:Z

    return-void
.end method

.method private updateSleepModeState()V
    .locals 1

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->isSleepMode()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mEnableepMode:Z

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->getSysScreenBrightness()I

    move-result v0

    iput v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mBrightness:I

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->getBrightnessMode()I

    move-result v0

    iput v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mBrightnessMode:I

    return-void
.end method

.method private writeGloveTouchForSmartFace(Ljava/lang/String;)V
    .locals 8
    .parameter "data"

    .prologue
    iget-object v5, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->gloveNodeLock:Ljava/lang/Object;

    monitor-enter v5

    :try_start_0
    new-instance v1, Ljava/io/File;

    const-string v4, "/data/tp/touch_mode"

    invoke-direct {v1, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v1, file:Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v4

    if-nez v4, :cond_0

    monitor-exit v5
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    return-void

    :cond_0
    const/4 v2, 0x0

    .local v2, writer:Ljava/io/FileWriter;
    :try_start_1
    new-instance v3, Ljava/io/FileWriter;

    const/4 v4, 0x0

    invoke-direct {v3, v1, v4}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .end local v2           #writer:Ljava/io/FileWriter;
    .local v3, writer:Ljava/io/FileWriter;
    :try_start_2
    invoke-virtual {v3, p1}, Ljava/io/FileWriter;->write(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/FileWriter;->flush()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    if-eqz v3, :cond_3

    :try_start_3
    invoke-virtual {v3}, Ljava/io/FileWriter;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    move-object v2, v3

    .end local v3           #writer:Ljava/io/FileWriter;
    .restart local v2       #writer:Ljava/io/FileWriter;
    :cond_1
    :goto_1
    :try_start_4
    monitor-exit v5

    goto :goto_0

    .end local v1           #file:Ljava/io/File;
    .end local v2           #writer:Ljava/io/FileWriter;
    :catchall_0
    move-exception v4

    monitor-exit v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v4

    .restart local v1       #file:Ljava/io/File;
    .restart local v3       #writer:Ljava/io/FileWriter;
    :catch_0
    move-exception v0

    .local v0, e:Ljava/io/IOException;
    :try_start_5
    const-string v4, "SmartFaceManager"

    const-string v6, "writeGloveTouchForSmartFace close IOException"

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-object v2, v3

    .end local v3           #writer:Ljava/io/FileWriter;
    .restart local v2       #writer:Ljava/io/FileWriter;
    goto :goto_1

    .end local v0           #e:Ljava/io/IOException;
    :catch_1
    move-exception v0

    .restart local v0       #e:Ljava/io/IOException;
    :goto_2
    :try_start_6
    const-string v4, "SmartFaceManager"

    const-string v6, "writeGloveTouchForSmartFace IOException"

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    if-eqz v2, :cond_1

    :try_start_7
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2

    goto :goto_1

    :catch_2
    move-exception v0

    :try_start_8
    const-string v4, "SmartFaceManager"

    const-string v6, "writeGloveTouchForSmartFace close IOException"

    invoke-static {v4, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_1

    .end local v0           #e:Ljava/io/IOException;
    :catchall_1
    move-exception v4

    :goto_3
    if-eqz v2, :cond_2

    :try_start_9
    invoke-virtual {v2}, Ljava/io/FileWriter;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_3

    :cond_2
    :goto_4
    :try_start_a
    throw v4

    :catch_3
    move-exception v0

    .restart local v0       #e:Ljava/io/IOException;
    const-string v6, "SmartFaceManager"

    const-string v7, "writeGloveTouchForSmartFace close IOException"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto :goto_4

    .end local v0           #e:Ljava/io/IOException;
    .end local v2           #writer:Ljava/io/FileWriter;
    .restart local v3       #writer:Ljava/io/FileWriter;
    :catchall_2
    move-exception v4

    move-object v2, v3

    .end local v3           #writer:Ljava/io/FileWriter;
    .restart local v2       #writer:Ljava/io/FileWriter;
    goto :goto_3

    .end local v2           #writer:Ljava/io/FileWriter;
    .restart local v3       #writer:Ljava/io/FileWriter;
    :catch_4
    move-exception v0

    move-object v2, v3

    .end local v3           #writer:Ljava/io/FileWriter;
    .restart local v2       #writer:Ljava/io/FileWriter;
    goto :goto_2

    .end local v2           #writer:Ljava/io/FileWriter;
    .restart local v3       #writer:Ljava/io/FileWriter;
    :cond_3
    move-object v2, v3

    .end local v3           #writer:Ljava/io/FileWriter;
    .restart local v2       #writer:Ljava/io/FileWriter;
    goto :goto_1
.end method


# virtual methods
.method public disableHapticFeedback()Z
    .locals 1

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->isSmartFaceEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->isSmartFaceFunEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getScreenNodeMode(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .parameter "openMode"
    .parameter "filePath"

    .prologue
    const/4 v0, 0x0

    .local v0, flag:Z
    invoke-direct {p0, p2}, Lcom/android/internal/policy/impl/SmartFaceManager;->getScreenNodeModeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, value:Ljava/lang/String;
    const-string v2, "SmartFaceManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getScreenNodeMode value = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method protected handlePhoneStateChanged(Ljava/lang/String;)V
    .locals 4
    .parameter "newState"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    sget-object v1, Landroid/telephony/TelephonyManager;->EXTRA_STATE_IDLE:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iput v3, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPhoneState:I

    :cond_0
    :goto_0
    :try_start_0
    iget v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPhoneState:I

    if-nez v1, :cond_5

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->isSmartFaceEnable()Z

    move-result v1

    if-eqz v1, :cond_4

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->needTurnOffScreen:Z

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->showSmartFaceMain()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_1
    :goto_1
    return-void

    :cond_2
    sget-object v1, Landroid/telephony/TelephonyManager;->EXTRA_STATE_OFFHOOK:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    const/4 v1, 0x2

    iput v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPhoneState:I

    goto :goto_0

    :cond_3
    sget-object v1, Landroid/telephony/TelephonyManager;->EXTRA_STATE_RINGING:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iput v2, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPhoneState:I

    goto :goto_0

    :cond_4
    :try_start_1
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->dismissSmartFaceMain()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .local v0, exception:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .end local v0           #exception:Ljava/lang/Exception;
    :cond_5
    :try_start_2
    iget v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPhoneState:I

    if-ne v1, v2, :cond_1

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->isSmartFaceEnable()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->needTurnOffScreen:Z

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->dismissSmartFaceMain()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1
.end method

.method public interceptKeyBeforeQueueing(Landroid/view/KeyEvent;IZ)I
    .locals 3
    .parameter "event"
    .parameter "policyFlags"
    .parameter "isScreenOn"

    .prologue
    const/4 v2, -0x1

    .local v2, result:I
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    .local v1, keyCode:I
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->isSmartFaceEnable()Z

    move-result v0

    .local v0, isShow:Z
    sparse-switch v1, :sswitch_data_0

    .end local v2           #result:I
    :cond_0
    :goto_0
    return v2

    .restart local v2       #result:I
    :sswitch_0
    if-eqz v0, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    nop

    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_0
        0x4 -> :sswitch_0
        0x1b -> :sswitch_0
        0x52 -> :sswitch_0
    .end sparse-switch
.end method

.method public needRotationScreen()Z
    .locals 1

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->isSmartFaceEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/internal/policy/impl/SmartFaceManager;->isSmartFaceFunEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public turnOffScreen()V
    .locals 4

    .prologue
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->needTurnOffScreen:Z

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->gloveNodeLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/SmartFaceManager;->mPowerManager:Landroid/os/PowerManager;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Landroid/os/PowerManager;->goToSleep(J)V

    monitor-exit v1

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
