.class Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;
.super Ljava/lang/Object;
.source "PowerAndVolumeScreenshotCtrl.java"

# interfaces
.implements Lcom/android/internal/policy/impl/IKeyBeforeDispatchingHandler;
.implements Lcom/android/internal/policy/impl/IKeyBeforeQueueingHandler;
.implements Lcom/android/internal/policy/impl/ISettingListener;


# static fields
.field private static final POWER_VOLUME_SCREENSHOT:Ljava/lang/String; = "power_volume_screenshot"

.field private static final SCREENSHOT_CHORD_DEBOUNCE_DELAY_MILLIS:J = 0x12cL

.field private static final TAG:Ljava/lang/String; = "FreeSnapshotCtrl"


# instance fields
.field private mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

.field private mPowerKeyTime:J

.field private mPowerKeyTriggered:Z

.field private mScreenshotEnable:Z

.field private final mScreenshotForLog:Ljava/lang/Runnable;

.field private final mScreenshotRunnable:Ljava/lang/Runnable;

.field private mVolumeDownKeyConsumedByScreenshotChord:Z

.field private mVolumeDownKeyTime:J

.field private mVolumeDownKeyTriggered:Z

.field private mVolumeUpKeyConsumedByScreenshotChord:Z

.field private mVolumeUpKeyTime:J

.field private mVolumeUpKeyTriggered:Z


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/PhoneWindowManager;Landroid/content/Context;)V
    .locals 1
    .parameter "manager"
    .parameter "context"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl$1;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl$1;-><init>(Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mScreenshotRunnable:Ljava/lang/Runnable;

    new-instance v0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl$2;

    invoke-direct {v0, p0}, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl$2;-><init>(Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mScreenshotForLog:Ljava/lang/Runnable;

    iput-object p2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mContext:Landroid/content/Context;

    iput-object p1, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;)Lcom/android/internal/policy/impl/PhoneWindowManager;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method private cancelPendingScreenshotChordAction()V
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mScreenshotRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method private cancelPendingScreenshotForLog()V
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mScreenshotForLog:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method private closeOriginScreenshot()V
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/android/internal/policy/impl/PhoneWindowManager;->setScreenshotChordEnabled(Z)V

    return-void
.end method

.method private getScreenshotChordLongPressDelay()J
    .locals 2

    .prologue
    invoke-static {}, Landroid/view/ViewConfiguration;->getGlobalActionKeyTimeout()J

    move-result-wide v0

    return-wide v0
.end method

.method private interceptScreenshotChord()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x12c

    iget-boolean v2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mScreenshotEnable:Z

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeDownKeyTriggered:Z

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mPowerKeyTriggered:Z

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeUpKeyTriggered:Z

    if-nez v2, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .local v0, now:J
    iget-wide v2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeDownKeyTime:J

    add-long/2addr v2, v4

    cmp-long v2, v0, v2

    if-gtz v2, :cond_0

    iget-wide v2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mPowerKeyTime:J

    add-long/2addr v2, v4

    cmp-long v2, v0, v2

    if-gtz v2, :cond_0

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeDownKeyConsumedByScreenshotChord:Z

    invoke-direct {p0}, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->cancelPendingScreenshotChordAction()V

    iget-object v2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mScreenshotRunnable:Ljava/lang/Runnable;

    invoke-direct {p0}, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->getScreenshotChordLongPressDelay()J

    move-result-wide v4

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .end local v0           #now:J
    :cond_0
    return-void
.end method

.method private interceptScreenshotLog()V
    .locals 6

    .prologue
    const-wide/16 v4, 0x12c

    iget-boolean v2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mScreenshotEnable:Z

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeUpKeyTriggered:Z

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mPowerKeyTriggered:Z

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeDownKeyTriggered:Z

    if-nez v2, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .local v0, now:J
    iget-wide v2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeUpKeyTime:J

    add-long/2addr v2, v4

    cmp-long v2, v0, v2

    if-gtz v2, :cond_0

    iget-wide v2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mPowerKeyTime:J

    add-long/2addr v2, v4

    cmp-long v2, v0, v2

    if-gtz v2, :cond_0

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeUpKeyConsumedByScreenshotChord:Z

    invoke-direct {p0}, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->cancelPendingScreenshotForLog()V

    iget-object v2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mScreenshotForLog:Ljava/lang/Runnable;

    invoke-direct {p0}, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->getScreenshotChordLongPressDelay()J

    move-result-wide v4

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .end local v0           #now:J
    :cond_0
    return-void
.end method


# virtual methods
.method public interceptKeyBeforeDispatching(Landroid/view/WindowManagerPolicy$WindowState;Landroid/view/KeyEvent;I)J
    .locals 11
    .parameter "win"
    .parameter "event"
    .parameter "policyFlags"

    .prologue
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v2

    .local v2, keyCode:I
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getFlags()I

    move-result v1

    .local v1, flags:I
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v7

    if-nez v7, :cond_0

    const/4 v0, 0x1

    .local v0, down:Z
    :goto_0
    iget-boolean v7, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mScreenshotEnable:Z

    if-eqz v7, :cond_6

    and-int/lit16 v7, v1, 0x400

    if-nez v7, :cond_6

    iget-boolean v7, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeDownKeyTriggered:Z

    if-eqz v7, :cond_1

    iget-boolean v7, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mPowerKeyTriggered:Z

    if-nez v7, :cond_1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    .local v3, now:J
    iget-wide v7, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeDownKeyTime:J

    const-wide/16 v9, 0x12c

    add-long v5, v7, v9

    .local v5, timeoutTime:J
    cmp-long v7, v3, v5

    if-gez v7, :cond_1

    sub-long v7, v5, v3

    .end local v3           #now:J
    .end local v5           #timeoutTime:J
    :goto_1
    return-wide v7

    .end local v0           #down:Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .restart local v0       #down:Z
    :cond_1
    const/16 v7, 0x19

    if-ne v2, v7, :cond_3

    iget-boolean v7, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeDownKeyConsumedByScreenshotChord:Z

    if-eqz v7, :cond_3

    if-nez v0, :cond_2

    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeDownKeyConsumedByScreenshotChord:Z

    :cond_2
    const-wide/16 v7, -0x1

    goto :goto_1

    :cond_3
    iget-boolean v7, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeUpKeyTriggered:Z

    if-eqz v7, :cond_4

    iget-boolean v7, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mPowerKeyTriggered:Z

    if-nez v7, :cond_4

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    .restart local v3       #now:J
    iget-wide v7, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeUpKeyTime:J

    const-wide/16 v9, 0x12c

    add-long v5, v7, v9

    .restart local v5       #timeoutTime:J
    cmp-long v7, v3, v5

    if-gez v7, :cond_4

    sub-long v7, v5, v3

    goto :goto_1

    .end local v3           #now:J
    .end local v5           #timeoutTime:J
    :cond_4
    const/16 v7, 0x18

    if-ne v2, v7, :cond_6

    iget-boolean v7, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeUpKeyConsumedByScreenshotChord:Z

    if-eqz v7, :cond_6

    if-nez v0, :cond_5

    const/4 v7, 0x0

    iput-boolean v7, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeUpKeyConsumedByScreenshotChord:Z

    :cond_5
    const-wide/16 v7, -0x1

    goto :goto_1

    :cond_6
    const-wide/high16 v7, -0x8000

    goto :goto_1
.end method

.method public interceptKeyBeforeQueueing(Landroid/view/KeyEvent;IZ)I
    .locals 7
    .parameter "event"
    .parameter "policyFlags"
    .parameter "isScreenOn"

    .prologue
    const/4 v6, -0x1

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-boolean v4, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mScreenshotEnable:Z

    if-nez v4, :cond_1

    :cond_0
    :goto_0
    return v6

    :cond_1
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v1

    .local v1, keyCode:I
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v4

    if-nez v4, :cond_2

    move v0, v2

    .local v0, down:Z
    :goto_1
    const/16 v4, 0x19

    if-ne v1, v4, :cond_4

    if-eqz v0, :cond_3

    if-eqz p3, :cond_0

    iget-boolean v4, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeDownKeyTriggered:Z

    if-nez v4, :cond_0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getFlags()I

    move-result v4

    and-int/lit16 v4, v4, 0x400

    if-nez v4, :cond_0

    iput-boolean v2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeDownKeyTriggered:Z

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getDownTime()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeDownKeyTime:J

    iput-boolean v3, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeDownKeyConsumedByScreenshotChord:Z

    invoke-direct {p0}, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->interceptScreenshotChord()V

    goto :goto_0

    .end local v0           #down:Z
    :cond_2
    move v0, v3

    goto :goto_1

    .restart local v0       #down:Z
    :cond_3
    iput-boolean v3, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeDownKeyTriggered:Z

    goto :goto_0

    :cond_4
    const/16 v4, 0x18

    if-ne v1, v4, :cond_6

    if-eqz v0, :cond_5

    if-eqz p3, :cond_0

    iget-boolean v4, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeUpKeyTriggered:Z

    if-nez v4, :cond_0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getFlags()I

    move-result v4

    and-int/lit16 v4, v4, 0x400

    if-nez v4, :cond_0

    iput-boolean v2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeUpKeyTriggered:Z

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getDownTime()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeUpKeyTime:J

    iput-boolean v3, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeUpKeyConsumedByScreenshotChord:Z

    invoke-direct {p0}, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->interceptScreenshotLog()V

    goto :goto_0

    :cond_5
    iput-boolean v3, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mVolumeUpKeyTriggered:Z

    goto :goto_0

    :cond_6
    const/16 v4, 0x1a

    if-ne v1, v4, :cond_0

    if-eqz v0, :cond_7

    if-eqz p3, :cond_0

    iget-boolean v3, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mPowerKeyTriggered:Z

    if-nez v3, :cond_0

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getFlags()I

    move-result v3

    and-int/lit16 v3, v3, 0x400

    if-nez v3, :cond_0

    iput-boolean v2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mPowerKeyTriggered:Z

    invoke-virtual {p1}, Landroid/view/KeyEvent;->getDownTime()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mPowerKeyTime:J

    invoke-direct {p0}, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->interceptScreenshotChord()V

    invoke-direct {p0}, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->interceptScreenshotLog()V

    goto :goto_0

    :cond_7
    iput-boolean v3, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mPowerKeyTriggered:Z

    goto :goto_0
.end method

.method public registerSettingsObserver(Landroid/content/ContentResolver;Landroid/database/ContentObserver;)V
    .locals 3
    .parameter "resolver"
    .parameter "observer"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->closeOriginScreenshot()V

    const-string v0, "power_volume_screenshot"

    invoke-static {v0}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, -0x1

    invoke-virtual {p1, v0, v1, p2, v2}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    return-void
.end method

.method public updateSettings()V
    .locals 4

    .prologue
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "power_volume_screenshot"

    const/4 v3, -0x2

    invoke-static {v1, v2, v0, v3}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v1

    if-nez v1, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;->mScreenshotEnable:Z

    return-void

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
