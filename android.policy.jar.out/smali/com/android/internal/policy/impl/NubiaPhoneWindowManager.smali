.class Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;
.super Ljava/lang/Object;
.source "NubiaPhoneWindowManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/policy/impl/NubiaPhoneWindowManager$SettingsObserver;
    }
.end annotation


# instance fields
.field private mAntiMisOperationCtrl:Lcom/android/internal/policy/impl/AntiMisOperationCtrl;

.field private mBreathingLightCtrl:Lcom/android/internal/policy/impl/BreathingLightCtrl;

.field private mCameraCtrl:Lcom/android/internal/policy/impl/CameraCtrl;

.field private mContext:Landroid/content/Context;

.field private mDispatchingHandlers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/policy/impl/IKeyBeforeDispatchingHandler;",
            ">;"
        }
    .end annotation
.end field

.field private mDoubleClickScreenOnCtrl:Lcom/android/internal/policy/impl/DoubleClickScreenOnCtrl;

.field private mFactoryTestDisableKeys:Lcom/android/internal/policy/impl/FactoryTestDisableKeys;

.field private mFreeSnapshotCtrl:Lcom/android/internal/policy/impl/FreeSnapshotCtrl;

.field private mPaoFenApplicationCtrl:Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;

.field private mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

.field private mPowerAndVolumeScreenshotCtrl:Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;

.field private mQueueingHandlers:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/policy/impl/IKeyBeforeQueueingHandler;",
            ">;"
        }
    .end annotation
.end field

.field private mSettingListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/policy/impl/ISettingListener;",
            ">;"
        }
    .end annotation
.end field

.field private mShutdownAnimationCtrl:Lcom/android/internal/policy/impl/ShutdownAnimationCtrl;

.field private mSingleUICtrl:Lcom/android/internal/policy/impl/SingleUICtrl;

.field private mSmartFaceCtrl:Lcom/android/internal/policy/impl/SmartFaceManager;

.field private mTouchHomeLightCtrl:Lcom/android/internal/policy/impl/TouchHomeLightCtrl;

.field private mVolleyGestureCtrl:Lcom/android/internal/policy/impl/VolleyGestureCtrl;

.field private mWindowManager:Landroid/view/IWindowManager;

.field private mWindowManagerFuncs:Landroid/view/WindowManagerPolicy$WindowManagerFuncs;

.field private mtouchGestureFuncsCtrl:Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/PhoneWindowManager;Landroid/content/Context;Landroid/view/IWindowManager;Landroid/view/WindowManagerPolicy$WindowManagerFuncs;)V
    .locals 1
    .parameter "manager"
    .parameter "context"
    .parameter "windowManager"
    .parameter "windowManagerFuncs"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mDispatchingHandlers:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mQueueingHandlers:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mSettingListeners:Ljava/util/ArrayList;

    iput-object p2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mContext:Landroid/content/Context;

    iput-object p1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iput-object p3, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mWindowManager:Landroid/view/IWindowManager;

    iput-object p4, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mWindowManagerFuncs:Landroid/view/WindowManagerPolicy$WindowManagerFuncs;

    invoke-direct {p0}, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->initCtrls()V

    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method private initCtrls()V
    .locals 4

    .prologue
    new-instance v1, Lcom/android/internal/policy/impl/ShutdownAnimationCtrl;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/android/internal/policy/impl/ShutdownAnimationCtrl;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mShutdownAnimationCtrl:Lcom/android/internal/policy/impl/ShutdownAnimationCtrl;

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mQueueingHandlers:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mShutdownAnimationCtrl:Lcom/android/internal/policy/impl/ShutdownAnimationCtrl;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iget-object v3, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, v3}, Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;-><init>(Lcom/android/internal/policy/impl/PhoneWindowManager;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mPowerAndVolumeScreenshotCtrl:Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mDispatchingHandlers:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mPowerAndVolumeScreenshotCtrl:Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mSettingListeners:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mPowerAndVolumeScreenshotCtrl:Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mQueueingHandlers:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mPowerAndVolumeScreenshotCtrl:Lcom/android/internal/policy/impl/PowerAndVolumeScreenshotCtrl;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/android/internal/policy/impl/FreeSnapshotCtrl;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iget-object v3, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, v3}, Lcom/android/internal/policy/impl/FreeSnapshotCtrl;-><init>(Lcom/android/internal/policy/impl/PhoneWindowManager;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mFreeSnapshotCtrl:Lcom/android/internal/policy/impl/FreeSnapshotCtrl;

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mDispatchingHandlers:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mFreeSnapshotCtrl:Lcom/android/internal/policy/impl/FreeSnapshotCtrl;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mSettingListeners:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mFreeSnapshotCtrl:Lcom/android/internal/policy/impl/FreeSnapshotCtrl;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const-string v2, "cn.nubia.wake.gesture"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Lcom/android/internal/policy/impl/DoubleClickScreenOnCtrl;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iget-object v3, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, v3}, Lcom/android/internal/policy/impl/DoubleClickScreenOnCtrl;-><init>(Lcom/android/internal/policy/impl/PhoneWindowManager;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mDoubleClickScreenOnCtrl:Lcom/android/internal/policy/impl/DoubleClickScreenOnCtrl;

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mQueueingHandlers:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mDoubleClickScreenOnCtrl:Lcom/android/internal/policy/impl/DoubleClickScreenOnCtrl;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mSettingListeners:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mDoubleClickScreenOnCtrl:Lcom/android/internal/policy/impl/DoubleClickScreenOnCtrl;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    new-instance v1, Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iget-object v3, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, v3}, Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;-><init>(Lcom/android/internal/policy/impl/PhoneWindowManager;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mtouchGestureFuncsCtrl:Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mSettingListeners:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mtouchGestureFuncsCtrl:Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/android/internal/policy/impl/FactoryTestDisableKeys;

    invoke-direct {v1}, Lcom/android/internal/policy/impl/FactoryTestDisableKeys;-><init>()V

    iput-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mFactoryTestDisableKeys:Lcom/android/internal/policy/impl/FactoryTestDisableKeys;

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mDispatchingHandlers:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mFactoryTestDisableKeys:Lcom/android/internal/policy/impl/FactoryTestDisableKeys;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mQueueingHandlers:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mFactoryTestDisableKeys:Lcom/android/internal/policy/impl/FactoryTestDisableKeys;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/android/internal/policy/impl/AntiMisOperationCtrl;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iget-object v3, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, v3}, Lcom/android/internal/policy/impl/AntiMisOperationCtrl;-><init>(Lcom/android/internal/policy/impl/PhoneWindowManager;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mAntiMisOperationCtrl:Lcom/android/internal/policy/impl/AntiMisOperationCtrl;

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mDispatchingHandlers:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mAntiMisOperationCtrl:Lcom/android/internal/policy/impl/AntiMisOperationCtrl;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/android/internal/policy/impl/BreathingLightCtrl;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mWindowManagerFuncs:Landroid/view/WindowManagerPolicy$WindowManagerFuncs;

    invoke-direct {v1, v2}, Lcom/android/internal/policy/impl/BreathingLightCtrl;-><init>(Landroid/view/WindowManagerPolicy$WindowManagerFuncs;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mBreathingLightCtrl:Lcom/android/internal/policy/impl/BreathingLightCtrl;

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mDispatchingHandlers:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mBreathingLightCtrl:Lcom/android/internal/policy/impl/BreathingLightCtrl;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/android/internal/policy/impl/SingleUICtrl;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/android/internal/policy/impl/SingleUICtrl;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mSingleUICtrl:Lcom/android/internal/policy/impl/SingleUICtrl;

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mSettingListeners:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mSingleUICtrl:Lcom/android/internal/policy/impl/SingleUICtrl;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const-string v2, "cn.nubia.smartface.feature"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    .local v0, smartFaceEnable:Z
    if-eqz v0, :cond_1

    new-instance v1, Lcom/android/internal/policy/impl/SmartFaceManager;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    invoke-direct {v1, v2, v3}, Lcom/android/internal/policy/impl/SmartFaceManager;-><init>(Landroid/content/Context;Lcom/android/internal/policy/impl/PhoneWindowManager;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mSmartFaceCtrl:Lcom/android/internal/policy/impl/SmartFaceManager;

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mQueueingHandlers:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mSmartFaceCtrl:Lcom/android/internal/policy/impl/SmartFaceManager;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    new-instance v1, Lcom/android/internal/policy/impl/TouchHomeLightCtrl;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iget-object v3, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2, v3}, Lcom/android/internal/policy/impl/TouchHomeLightCtrl;-><init>(Lcom/android/internal/policy/impl/PhoneWindowManager;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mTouchHomeLightCtrl:Lcom/android/internal/policy/impl/TouchHomeLightCtrl;

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mDispatchingHandlers:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mTouchHomeLightCtrl:Lcom/android/internal/policy/impl/TouchHomeLightCtrl;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/android/internal/policy/impl/VolleyGestureCtrl;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mVolleyGestureCtrl:Lcom/android/internal/policy/impl/VolleyGestureCtrl;

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mSettingListeners:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mVolleyGestureCtrl:Lcom/android/internal/policy/impl/VolleyGestureCtrl;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mContext:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mPaoFenApplicationCtrl:Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;

    new-instance v1, Lcom/android/internal/policy/impl/CameraCtrl;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    invoke-direct {v1, v2, v3}, Lcom/android/internal/policy/impl/CameraCtrl;-><init>(Landroid/content/Context;Lcom/android/internal/policy/impl/PhoneWindowManager;)V

    iput-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mCameraCtrl:Lcom/android/internal/policy/impl/CameraCtrl;

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mQueueingHandlers:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mCameraCtrl:Lcom/android/internal/policy/impl/CameraCtrl;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mDispatchingHandlers:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mCameraCtrl:Lcom/android/internal/policy/impl/CameraCtrl;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method static isCameraViewOnSafeMode(Landroid/view/WindowManagerPolicy$WindowState;)Z
    .locals 1
    .parameter "mTopFullscreenOpaqueWindowState"

    .prologue
    invoke-static {p0}, Lcom/android/internal/policy/impl/CameraOnSafeModeCtrl;->isCameraViewOnSafeMode(Landroid/view/WindowManagerPolicy$WindowState;)Z

    move-result v0

    return v0
.end method

.method static isFinishKeyBeforDispatching(J)Z
    .locals 2
    .parameter "result"

    .prologue
    const-wide/high16 v0, -0x8000

    cmp-long v0, p0, v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static isFinishKeyBeforQueueing(I)Z
    .locals 1
    .parameter "result"

    .prologue
    const/4 v0, -0x1

    if-eq p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static isFinishRotationForOrientationLw(I)Z
    .locals 1
    .parameter "result"

    .prologue
    const/4 v0, -0x1

    if-eq p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private observeSetting()V
    .locals 4

    .prologue
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .local v0, handler:Landroid/os/Handler;
    iget-object v3, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mSettingListeners:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/policy/impl/ISettingListener;

    .local v2, listener:Lcom/android/internal/policy/impl/ISettingListener;
    new-instance v3, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager$SettingsObserver;

    invoke-direct {v3, p0, v0, v2}, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager$SettingsObserver;-><init>(Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;Landroid/os/Handler;Lcom/android/internal/policy/impl/ISettingListener;)V

    invoke-virtual {v3}, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager$SettingsObserver;->observe()V

    goto :goto_0

    .end local v2           #listener:Lcom/android/internal/policy/impl/ISettingListener;
    :cond_0
    return-void
.end method


# virtual methods
.method init()V
    .locals 0

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->observeSetting()V

    return-void
.end method

.method interceptKeyBeforeDispatching(Landroid/view/WindowManagerPolicy$WindowState;Landroid/view/KeyEvent;I)J
    .locals 8
    .parameter "win"
    .parameter "event"
    .parameter "policyFlags"

    .prologue
    const-wide/high16 v2, -0x8000

    .local v2, result:J
    iget-object v6, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mDispatchingHandlers:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/policy/impl/IKeyBeforeDispatchingHandler;

    .local v0, handler:Lcom/android/internal/policy/impl/IKeyBeforeDispatchingHandler;
    invoke-interface {v0, p1, p2, p3}, Lcom/android/internal/policy/impl/IKeyBeforeDispatchingHandler;->interceptKeyBeforeDispatching(Landroid/view/WindowManagerPolicy$WindowState;Landroid/view/KeyEvent;I)J

    move-result-wide v2

    const-wide/high16 v6, -0x8000

    cmp-long v6, v2, v6

    if-eqz v6, :cond_0

    move-wide v4, v2

    .end local v0           #handler:Lcom/android/internal/policy/impl/IKeyBeforeDispatchingHandler;
    .end local v2           #result:J
    .local v4, result:J
    :goto_0
    return-wide v4

    .end local v4           #result:J
    .restart local v2       #result:J
    :cond_1
    move-wide v4, v2

    .end local v2           #result:J
    .restart local v4       #result:J
    goto :goto_0
.end method

.method interceptKeyBeforeQueueing(Landroid/view/KeyEvent;IZ)I
    .locals 5
    .parameter "event"
    .parameter "policyFlags"
    .parameter "isScreenOn"

    .prologue
    const/4 v2, -0x1

    .local v2, result:I
    iget-object v4, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mQueueingHandlers:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/policy/impl/IKeyBeforeQueueingHandler;

    .local v0, handler:Lcom/android/internal/policy/impl/IKeyBeforeQueueingHandler;
    invoke-interface {v0, p1, p2, p3}, Lcom/android/internal/policy/impl/IKeyBeforeQueueingHandler;->interceptKeyBeforeQueueing(Landroid/view/KeyEvent;IZ)I

    move-result v2

    const/4 v4, -0x1

    if-eq v2, v4, :cond_0

    move v3, v2

    .end local v0           #handler:Lcom/android/internal/policy/impl/IKeyBeforeQueueingHandler;
    .end local v2           #result:I
    .local v3, result:I
    :goto_0
    return v3

    .end local v3           #result:I
    .restart local v2       #result:I
    :cond_1
    move v3, v2

    .end local v2           #result:I
    .restart local v3       #result:I
    goto :goto_0
.end method

.method playSoundEffect(Landroid/view/KeyEvent;IZ)V
    .locals 3
    .parameter "event"
    .parameter "keyCode"
    .parameter "keyguardOn"

    .prologue
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    const/4 v1, 0x3

    if-eq p2, v1, :cond_0

    const/4 v1, 0x4

    if-eq p2, v1, :cond_0

    const/16 v1, 0x52

    if-eq p2, v1, :cond_0

    const/16 v1, 0x54

    if-ne p2, v1, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mContext:Landroid/content/Context;

    const-string v2, "audio"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    .local v0, audioManager:Landroid/media/AudioManager;
    if-eqz v0, :cond_1

    if-nez p3, :cond_1

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->playSoundEffect(I)V

    .end local v0           #audioManager:Landroid/media/AudioManager;
    :cond_1
    return-void
.end method

.method rotationForOrientationLw(I)I
    .locals 2
    .parameter "orientation"

    .prologue
    const/4 v0, -0x1

    .local v0, currentOrientation:I
    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mSmartFaceCtrl:Lcom/android/internal/policy/impl/SmartFaceManager;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mSmartFaceCtrl:Lcom/android/internal/policy/impl/SmartFaceManager;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/SmartFaceManager;->needRotationScreen()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    :cond_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mSingleUICtrl:Lcom/android/internal/policy/impl/SingleUICtrl;

    invoke-virtual {v1, v0, p1}, Lcom/android/internal/policy/impl/SingleUICtrl;->changeOrientationSensor(II)V

    return v0
.end method

.method screenTurnedOff(I)V
    .locals 1
    .parameter "why"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mSingleUICtrl:Lcom/android/internal/policy/impl/SingleUICtrl;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/SingleUICtrl;->disableSingleUI()V

    return-void
.end method

.method screenTurningOn(Landroid/view/WindowManagerPolicy$ScreenOnListener;)V
    .locals 1
    .parameter "screenOnListener"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mSingleUICtrl:Lcom/android/internal/policy/impl/SingleUICtrl;

    invoke-virtual {v0}, Lcom/android/internal/policy/impl/SingleUICtrl;->enableSingleUI()V

    return-void
.end method

.method updatePackageChanged(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "clazzName"
    .parameter "pkgName"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mVolleyGestureCtrl:Lcom/android/internal/policy/impl/VolleyGestureCtrl;

    invoke-virtual {v0, p1, p2}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->updatePackageChanged(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mPaoFenApplicationCtrl:Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;

    invoke-virtual {v0, p1, p2}, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->updatePackageChanged(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method updateSettings()V
    .locals 3

    .prologue
    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mPhoneWindowManager:Lcom/android/internal/policy/impl/PhoneWindowManager;

    iget-boolean v2, v2, Lcom/android/internal/policy/impl/PhoneWindowManager;->mSystemReady:Z

    if-nez v2, :cond_1

    :cond_0
    return-void

    :cond_1
    iget-object v2, p0, Lcom/android/internal/policy/impl/NubiaPhoneWindowManager;->mSettingListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/policy/impl/ISettingListener;

    .local v0, handler:Lcom/android/internal/policy/impl/ISettingListener;
    invoke-interface {v0}, Lcom/android/internal/policy/impl/ISettingListener;->updateSettings()V

    goto :goto_0
.end method
