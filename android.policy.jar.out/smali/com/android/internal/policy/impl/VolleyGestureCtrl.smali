.class public Lcom/android/internal/policy/impl/VolleyGestureCtrl;
.super Ljava/lang/Object;
.source "VolleyGestureCtrl.java"

# interfaces
.implements Lcom/android/internal/policy/impl/ISettingListener;


# instance fields
.field private final ORIENTATION_E:I

.field private final ORIENTATION_N:I

.field private final ORIENTATION_S:I

.field private final ORIENTATION_W:I

.field private final TAG:Ljava/lang/String;

.field private final VOLLEY_FILTER_CLASS_NAME:[Ljava/lang/String;

.field private final VOLLEY_WHITE_LIST:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mVolleyDetector:Lnubia/gesture/sensor/MotionDetector;

.field private mVolleyFilter:Ljava/lang/String;

.field private mVolleyListener:Lnubia/gesture/sensor/MotionListener;

.field private mVolleyMode:I

.field private mVolleyRegistered:Z

.field private mWindowHeight:I

.field private mWindowWidth:I

.field private moveStatus:I

.field private now_x:I

.field private now_y:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 5
    .parameter "context"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "VolleyGestureCtrl"

    iput-object v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->TAG:Ljava/lang/String;

    const-string v0, "volley_white_list"

    iput-object v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->VOLLEY_WHITE_LIST:Ljava/lang/String;

    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "com.android.phone.InCallScreen"

    aput-object v1, v0, v2

    iput-object v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->VOLLEY_FILTER_CLASS_NAME:[Ljava/lang/String;

    iput v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyMode:I

    iput-object v3, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyFilter:Ljava/lang/String;

    iput-object v3, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyListener:Lnubia/gesture/sensor/MotionListener;

    iput-object v3, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyDetector:Lnubia/gesture/sensor/MotionDetector;

    iput-boolean v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyRegistered:Z

    iput v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    iput v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    iput v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iput v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iput v4, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->ORIENTATION_N:I

    const/4 v0, 0x2

    iput v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->ORIENTATION_S:I

    const/4 v0, 0x3

    iput v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->ORIENTATION_W:I

    const/4 v0, 0x4

    iput v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->ORIENTATION_E:I

    iput v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->moveStatus:I

    iput-object p1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mContext:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/policy/impl/VolleyGestureCtrl;Lnubia/gesture/sensor/MotionState;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->dispatchVolleyEvent(Lnubia/gesture/sensor/MotionState;)V

    return-void
.end method

.method private beginToHandleVolley()V
    .locals 8

    .prologue
    invoke-static {}, Landroid/app/ActivityManagerNative;->isSystemReady()Z

    move-result v4

    if-eqz v4, :cond_0

    :try_start_0
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v4

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-interface {v4, v5, v6, v7}, Landroid/app/IActivityManager;->getTasks(IILandroid/app/IThumbnailReceiver;)Ljava/util/List;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/ActivityManager$RunningTaskInfo;

    iget-object v1, v4, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    .local v1, cn:Landroid/content/ComponentName;
    invoke-virtual {v1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v0

    .local v0, clazzName:Ljava/lang/String;
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v3

    .local v3, packageName:Ljava/lang/String;
    invoke-virtual {p0, v0, v3}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->updatePackageChanged(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v0           #clazzName:Ljava/lang/String;
    .end local v1           #cn:Landroid/content/ComponentName;
    .end local v3           #packageName:Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    :catch_0
    move-exception v2

    .local v2, e:Landroid/os/RemoteException;
    const-string v4, "VolleyGestureCtrl"

    const-string v5, " do Enable Volley Gesture failed!"

    invoke-static {v4, v5}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private disableVolleyGesture()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const-string v0, "VolleyGestureCtrl"

    const-string v1, "disableVolleyGesture"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyDetector:Lnubia/gesture/sensor/MotionDetector;

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->unregisterVolleyListener()V

    iput-object v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyDetector:Lnubia/gesture/sensor/MotionDetector;

    :cond_0
    iget-object v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyListener:Lnubia/gesture/sensor/MotionListener;

    if-eqz v0, :cond_1

    iput-object v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyListener:Lnubia/gesture/sensor/MotionListener;

    :cond_1
    return-void
.end method

.method private dispatchVolleyEvent(Lnubia/gesture/sensor/MotionState;)V
    .locals 10
    .parameter "state"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x2

    const/4 v2, 0x1

    const/16 v5, 0xa

    const/4 v8, 0x2

    .local v8, speed:I
    new-instance v6, Landroid/util/DisplayMetrics;

    invoke-direct {v6}, Landroid/util/DisplayMetrics;-><init>()V

    .local v6, dm:Landroid/util/DisplayMetrics;
    iget-object v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mContext:Landroid/content/Context;

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/view/WindowManager;

    .local v9, wm:Landroid/view/WindowManager;
    invoke-interface {v9}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget v0, v6, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    iget v0, v6, Landroid/util/DisplayMetrics;->heightPixels:I

    iput v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    const/4 v7, 0x0

    .local v7, oritation:I
    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    if-le v0, v1, :cond_1

    const/4 v7, 0x1

    :goto_0
    invoke-virtual {p1}, Lnubia/gesture/sensor/MotionState;->getState()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    :cond_0
    :goto_1
    return-void

    :cond_1
    const/4 v7, 0x2

    goto :goto_0

    :sswitch_0
    if-ne v7, v3, :cond_2

    invoke-virtual {p1}, Lnubia/gesture/sensor/MotionState;->getSpeed()I

    move-result v0

    invoke-direct {p0, v4, v0}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->handleEnter(II)V

    goto :goto_1

    :cond_2
    if-ne v7, v2, :cond_0

    invoke-virtual {p1}, Lnubia/gesture/sensor/MotionState;->getSpeed()I

    move-result v0

    invoke-direct {p0, v4, v0}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->handleLandEnter(II)V

    goto :goto_1

    :sswitch_1
    if-ne v7, v3, :cond_3

    invoke-virtual {p1}, Lnubia/gesture/sensor/MotionState;->getSpeed()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->handleHold(I)V

    goto :goto_1

    :cond_3
    if-ne v7, v2, :cond_0

    invoke-virtual {p1}, Lnubia/gesture/sensor/MotionState;->getSpeed()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->handleLandHold(I)V

    goto :goto_1

    :sswitch_2
    if-ne v7, v3, :cond_4

    invoke-virtual {p1}, Lnubia/gesture/sensor/MotionState;->getSpeed()I

    move-result v0

    invoke-direct {p0, v8, v0}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->handleOut(II)V

    goto :goto_1

    :cond_4
    if-ne v7, v2, :cond_0

    invoke-virtual {p1}, Lnubia/gesture/sensor/MotionState;->getSpeed()I

    move-result v0

    invoke-direct {p0, v8, v0}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->handleLandOut(II)V

    goto :goto_1

    :sswitch_3
    invoke-virtual {p1}, Lnubia/gesture/sensor/MotionState;->getSpeed()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto :goto_1

    :pswitch_1
    if-ne v7, v2, :cond_7

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v1, v0, 0x4

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v2, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v0, 0x4

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v0, 0x2

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipe(IIIII)Z

    goto :goto_1

    :pswitch_2
    if-ne v7, v2, :cond_5

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v2, v0, 0x4

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v4, v0, 0x4

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipe(IIIII)Z

    goto :goto_1

    :cond_5
    if-ne v7, v3, :cond_0

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v1, v0, 0x4

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v2, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v0, 0x4

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v0, 0x2

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipe(IIIII)Z

    goto/16 :goto_1

    :pswitch_3
    if-ne v7, v2, :cond_6

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v2, v0, 0x4

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v0, 0x4

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipe(IIIII)Z

    goto/16 :goto_1

    :cond_6
    if-ne v7, v3, :cond_0

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v0, 0x4

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v2, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v3, v0, 0x4

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v0, 0x2

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipe(IIIII)Z

    goto/16 :goto_1

    :cond_7
    if-ne v7, v3, :cond_0

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v2, v0, 0x4

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v0, 0x4

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipe(IIIII)Z

    goto/16 :goto_1

    :pswitch_4
    if-ne v7, v2, :cond_8

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v0, 0x4

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v2, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v3, v0, 0x4

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v0, 0x2

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipe(IIIII)Z

    goto/16 :goto_1

    :cond_8
    if-ne v7, v3, :cond_0

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v2, v0, 0x4

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v4, v0, 0x4

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipe(IIIII)Z

    goto/16 :goto_1

    :sswitch_4
    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    invoke-direct {p0, v0, v1}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeRelease(II)Z

    iput v4, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iput v4, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iput v4, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->moveStatus:I

    goto/16 :goto_1

    nop

    :sswitch_data_0
    .sparse-switch
        0x6e -> :sswitch_0
        0x78 -> :sswitch_1
        0x82 -> :sswitch_2
        0x8c -> :sswitch_3
        0x96 -> :sswitch_4
    .end sparse-switch

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_4
    .end packed-switch
.end method

.method private enableVolleyGesture()V
    .locals 4

    .prologue
    const-string v2, "hanchuang"

    const-string v3, "volley enableVolleyGesture"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyListener:Lnubia/gesture/sensor/MotionListener;

    if-nez v2, :cond_0

    new-instance v2, Lcom/android/internal/policy/impl/VolleyGestureCtrl$1;

    invoke-direct {v2, p0}, Lcom/android/internal/policy/impl/VolleyGestureCtrl$1;-><init>(Lcom/android/internal/policy/impl/VolleyGestureCtrl;)V

    iput-object v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyListener:Lnubia/gesture/sensor/MotionListener;

    :cond_0
    iget-object v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyDetector:Lnubia/gesture/sensor/MotionDetector;

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mContext:Landroid/content/Context;

    const/16 v3, 0x8

    invoke-static {v2, v3}, Lnubia/gesture/sensor/MotionManager;->getDefaultDetector(Landroid/content/Context;I)Lnubia/gesture/sensor/MotionDetector;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyDetector:Lnubia/gesture/sensor/MotionDetector;

    invoke-direct {p0}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->beginToHandleVolley()V

    :cond_1
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .local v0, dm:Landroid/util/DisplayMetrics;
    iget-object v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mContext:Landroid/content/Context;

    const-string v3, "window"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    .local v1, wm:Landroid/view/WindowManager;
    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iput v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    iget v2, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    iput v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    return-void
.end method

.method private filterVolleyApp(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6
    .parameter "clazzName"
    .parameter "pkgName"

    .prologue
    const/4 v4, 0x0

    iget-object v5, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyFilter:Ljava/lang/String;

    if-eqz v5, :cond_0

    invoke-static {}, Landroid/app/ActivityManagerNative;->isSystemReady()Z

    move-result v5

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyFilter:Ljava/lang/String;

    invoke-virtual {v5, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->VOLLEY_FILTER_CLASS_NAME:[Ljava/lang/String;

    .local v0, arr$:[Ljava/lang/String;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_0
    if-ge v2, v3, :cond_2

    aget-object v1, v0, v2

    .local v1, filter:Ljava/lang/String;
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .end local v0           #arr$:[Ljava/lang/String;
    .end local v1           #filter:Ljava/lang/String;
    .end local v2           #i$:I
    .end local v3           #len$:I
    :cond_0
    :goto_1
    return v4

    .restart local v0       #arr$:[Ljava/lang/String;
    .restart local v1       #filter:Ljava/lang/String;
    .restart local v2       #i$:I
    .restart local v3       #len$:I
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .end local v1           #filter:Ljava/lang/String;
    :cond_2
    const/4 v4, 0x1

    goto :goto_1
.end method

.method private handleEnter(II)V
    .locals 6
    .parameter "point_size"
    .parameter "orientation"

    .prologue
    const/4 v5, 0x4

    if-eqz p2, :cond_0

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->moveStatus:I

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    packed-switch p2, :pswitch_data_0

    :goto_1
    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    const/4 v0, 0x1

    iput v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->moveStatus:I

    goto :goto_0

    :pswitch_0
    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v0, 0x4

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v2, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v0, 0x2

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeFirst(IIIII)Z

    goto :goto_1

    :pswitch_1
    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v1, v0, 0x4

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v2, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v0, 0x2

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeFirst(IIIII)Z

    goto :goto_1

    :pswitch_2
    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v2, v0, 0x4

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v0, 0x2

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeFirst(IIIII)Z

    goto :goto_1

    :pswitch_3
    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v2, v0, 0x4

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v0, 0x2

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeFirst(IIIII)Z

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private handleHold(I)V
    .locals 6
    .parameter "o"

    .prologue
    const/4 v5, 0x2

    if-eqz p1, :cond_0

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->moveStatus:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v1, 0x32

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x4

    if-gt v0, v1, :cond_0

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v3, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v3, 0x32

    add-int/2addr v3, v0

    iget v4, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeMiddle(IIIII)Z

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v1, 0x32

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    goto :goto_0

    :pswitch_1
    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v1, 0x32

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v1, 0x4

    if-lt v0, v1, :cond_0

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v3, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v3, 0x32

    sub-int v3, v0, v3

    iget v4, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeMiddle(IIIII)Z

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v1, 0x32

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    goto :goto_0

    :pswitch_2
    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v1, v1, 0x32

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v1, v1, 0x4

    if-lt v0, v1, :cond_0

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v3, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v4, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v4, 0x32

    sub-int v4, v0, v4

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeMiddle(IIIII)Z

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v1, v1, 0x32

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    goto :goto_0

    :pswitch_3
    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v1, v1, 0x32

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x4

    if-gt v0, v1, :cond_0

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v3, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v4, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v4, 0x32

    add-int/2addr v4, v0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeMiddle(IIIII)Z

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v1, v1, 0x32

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private handleLandEnter(II)V
    .locals 6
    .parameter "point_size"
    .parameter "orientation"

    .prologue
    const/4 v5, 0x4

    if-eqz p2, :cond_0

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->moveStatus:I

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    packed-switch p2, :pswitch_data_0

    :goto_1
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->moveStatus:I

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    goto :goto_0

    :pswitch_0
    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v2, v0, 0x4

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v0, 0x2

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeFirst(IIIII)Z

    goto :goto_1

    :pswitch_1
    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v2, v0, 0x4

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v0, 0x2

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeFirst(IIIII)Z

    goto :goto_1

    :pswitch_2
    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v1, v0, 0x4

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v2, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v0, 0x2

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeFirst(IIIII)Z

    goto :goto_1

    :pswitch_3
    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v0, 0x4

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v2, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v0, 0x2

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v0, 0x2

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeFirst(IIIII)Z

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private handleLandHold(I)V
    .locals 6
    .parameter "o"

    .prologue
    const/4 v5, 0x2

    if-eqz p1, :cond_0

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->moveStatus:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v1, v1, 0x32

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v1, v1, 0x4

    if-lt v0, v1, :cond_0

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v3, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v4, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v4, 0x32

    sub-int v4, v0, v4

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeMiddle(IIIII)Z

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v1, v1, 0x32

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    goto :goto_0

    :pswitch_1
    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v1, v1, 0x32

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x4

    if-gt v0, v1, :cond_0

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v3, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v4, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v4, 0x32

    add-int/2addr v4, v0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeMiddle(IIIII)Z

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v1, v1, 0x32

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    goto :goto_0

    :pswitch_2
    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v1, 0x32

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v1, 0x4

    if-lt v0, v1, :cond_0

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v3, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v3, 0x32

    sub-int v3, v0, v3

    iget v4, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeMiddle(IIIII)Z

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v1, 0x32

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    goto :goto_0

    :pswitch_3
    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v1, 0x32

    add-int/2addr v0, v1

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x4

    if-gt v0, v1, :cond_0

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v3, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v3, 0x32

    add-int/2addr v3, v0

    iget v4, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeMiddle(IIIII)Z

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v1, v1, 0x32

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private handleLandOut(II)V
    .locals 7
    .parameter "speed"
    .parameter "out_orientation"

    .prologue
    const/4 v6, 0x0

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->moveStatus:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    :goto_0
    return-void

    :cond_0
    packed-switch p2, :pswitch_data_0

    :goto_1
    iput v6, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iput v6, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iput v6, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->moveStatus:I

    goto :goto_0

    :pswitch_0
    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v3, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v4, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v4, 0x4

    add-int/2addr v4, v0

    move-object v0, p0

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeAfter(IIIII)Z

    goto :goto_1

    :pswitch_1
    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v3, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v4, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v4, 0x4

    sub-int v4, v0, v4

    move-object v0, p0

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeAfter(IIIII)Z

    goto :goto_1

    :pswitch_2
    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v3, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v3, 0x4

    add-int/2addr v3, v0

    iget v4, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    move-object v0, p0

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeAfter(IIIII)Z

    goto :goto_1

    :pswitch_3
    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v3, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v3, 0x4

    sub-int v3, v0, v3

    iget v4, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    move-object v0, p0

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeAfter(IIIII)Z

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private handleOut(II)V
    .locals 7
    .parameter "speed"
    .parameter "out_orientation"

    .prologue
    const/4 v6, 0x0

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->moveStatus:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    :goto_0
    return-void

    :cond_0
    packed-switch p2, :pswitch_data_0

    :goto_1
    iput v6, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iput v6, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iput v6, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->moveStatus:I

    goto :goto_0

    :pswitch_0
    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v3, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v3, 0x4

    sub-int v3, v0, v3

    iget v4, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    move-object v0, p0

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeAfter(IIIII)Z

    goto :goto_1

    :pswitch_1
    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v3, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowWidth:I

    div-int/lit8 v3, v3, 0x4

    add-int/2addr v3, v0

    iget v4, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    move-object v0, p0

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeAfter(IIIII)Z

    goto :goto_1

    :pswitch_2
    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v3, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v4, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v4, 0x4

    sub-int v4, v0, v4

    move-object v0, p0

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeAfter(IIIII)Z

    goto :goto_1

    :pswitch_3
    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v2, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v3, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_x:I

    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->now_y:I

    iget v4, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mWindowHeight:I

    div-int/lit8 v4, v4, 0x4

    add-int/2addr v4, v0

    move-object v0, p0

    move v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->swipeAfter(IIIII)Z

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method private registerVolleyListener()V
    .locals 2

    .prologue
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyRegistered:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyDetector:Lnubia/gesture/sensor/MotionDetector;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyListener:Lnubia/gesture/sensor/MotionListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyDetector:Lnubia/gesture/sensor/MotionDetector;

    iget-object v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyListener:Lnubia/gesture/sensor/MotionListener;

    invoke-virtual {v0, v1}, Lnubia/gesture/sensor/MotionDetector;->registerListener(Lnubia/gesture/sensor/MotionListener;)V

    const-string v0, "VolleyGestureCtrl"

    const-string v1, "registerVolley"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyRegistered:Z

    :cond_0
    return-void
.end method

.method private swipe(IIIII)Z
    .locals 19
    .parameter "downX"
    .parameter "downY"
    .parameter "upX"
    .parameter "upY"
    .parameter "steps"

    .prologue
    const-string v3, "VolleyGestureCtrl"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "swipe steps = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p5

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v13, 0x0

    .local v13, ret:Z
    move/from16 v14, p5

    .local v14, swipeSteps:I
    const-wide/16 v15, 0x0

    .local v15, xStep:D
    const-wide/16 v17, 0x0

    .local v17, yStep:D
    const-wide/16 v1, 0x0

    .local v1, downTime:J
    if-nez v14, :cond_0

    const/4 v14, 0x1

    :cond_0
    sub-int v3, p3, p1

    int-to-double v3, v3

    int-to-double v5, v14

    div-double v15, v3, v5

    sub-int v3, p4, p2

    int-to-double v3, v3

    int-to-double v5, v14

    div-double v17, v3, v5

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    const/4 v5, 0x0

    move/from16 v0, p1

    int-to-float v6, v0

    move/from16 v0, p2

    int-to-float v7, v0

    const/4 v8, 0x1

    move-wide v3, v1

    invoke-static/range {v1 .. v8}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v9

    .local v9, event1:Landroid/view/MotionEvent;
    const/16 v3, 0x1002

    invoke-virtual {v9, v3}, Landroid/view/MotionEvent;->setSource(I)V

    invoke-static {}, Landroid/hardware/input/InputManager;->getInstance()Landroid/hardware/input/InputManager;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v3, v9, v4}, Landroid/hardware/input/InputManager;->injectInputEvent(Landroid/view/InputEvent;I)Z

    move-result v13

    const/4 v12, 0x1

    .local v12, i:I
    :goto_0
    if-ge v12, v14, :cond_1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    const/4 v5, 0x2

    int-to-double v6, v12

    mul-double/2addr v6, v15

    double-to-int v6, v6

    add-int v6, v6, p1

    int-to-float v6, v6

    int-to-double v7, v12

    mul-double v7, v7, v17

    double-to-int v7, v7

    add-int v7, v7, p2

    int-to-float v7, v7

    const/4 v8, 0x1

    invoke-static/range {v1 .. v8}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v10

    .local v10, event2:Landroid/view/MotionEvent;
    const/16 v3, 0x1002

    invoke-virtual {v10, v3}, Landroid/view/MotionEvent;->setSource(I)V

    invoke-static {}, Landroid/hardware/input/InputManager;->getInstance()Landroid/hardware/input/InputManager;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v3, v10, v4}, Landroid/hardware/input/InputManager;->injectInputEvent(Landroid/view/InputEvent;I)Z

    move-result v3

    and-int/2addr v13, v3

    if-nez v13, :cond_2

    .end local v10           #event2:Landroid/view/MotionEvent;
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    const/4 v5, 0x1

    move/from16 v0, p3

    int-to-float v6, v0

    move/from16 v0, p4

    int-to-float v7, v0

    const/4 v8, 0x1

    invoke-static/range {v1 .. v8}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v11

    .local v11, event3:Landroid/view/MotionEvent;
    const/16 v3, 0x1002

    invoke-virtual {v11, v3}, Landroid/view/MotionEvent;->setSource(I)V

    invoke-static {}, Landroid/hardware/input/InputManager;->getInstance()Landroid/hardware/input/InputManager;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v3, v11, v4}, Landroid/hardware/input/InputManager;->injectInputEvent(Landroid/view/InputEvent;I)Z

    move-result v3

    and-int/2addr v13, v3

    return v13

    .end local v11           #event3:Landroid/view/MotionEvent;
    .restart local v10       #event2:Landroid/view/MotionEvent;
    :cond_2
    const-wide/16 v3, 0x5

    invoke-static {v3, v4}, Landroid/os/SystemClock;->sleep(J)V

    add-int/lit8 v12, v12, 0x1

    goto :goto_0
.end method

.method private swipeAfter(IIIII)Z
    .locals 18
    .parameter "downX"
    .parameter "downY"
    .parameter "upX"
    .parameter "upY"
    .parameter "steps"

    .prologue
    const/4 v12, 0x0

    .local v12, ret:Z
    move/from16 v13, p5

    .local v13, swipeSteps:I
    const-wide/16 v14, 0x0

    .local v14, xStep:D
    const-wide/16 v16, 0x0

    .local v16, yStep:D
    const-wide/16 v1, 0x0

    .local v1, downTime:J
    if-nez v13, :cond_0

    const/4 v13, 0x1

    :cond_0
    sub-int v3, p3, p1

    int-to-double v3, v3

    int-to-double v5, v13

    div-double v14, v3, v5

    sub-int v3, p4, p2

    int-to-double v3, v3

    int-to-double v5, v13

    div-double v16, v3, v5

    const/4 v11, 0x1

    .local v11, i:I
    :goto_0
    if-ge v11, v13, :cond_2

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    const/4 v5, 0x2

    int-to-double v6, v11

    mul-double/2addr v6, v14

    double-to-int v6, v6

    add-int v6, v6, p1

    int-to-float v6, v6

    int-to-double v7, v11

    mul-double v7, v7, v16

    double-to-int v7, v7

    add-int v7, v7, p2

    int-to-float v7, v7

    const/4 v8, 0x1

    invoke-static/range {v1 .. v8}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v9

    .local v9, event2:Landroid/view/MotionEvent;
    const/16 v3, 0x1002

    invoke-virtual {v9, v3}, Landroid/view/MotionEvent;->setSource(I)V

    invoke-static {}, Landroid/hardware/input/InputManager;->getInstance()Landroid/hardware/input/InputManager;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v3, v9, v4}, Landroid/hardware/input/InputManager;->injectInputEvent(Landroid/view/InputEvent;I)Z

    move-result v3

    and-int/2addr v12, v3

    if-nez v12, :cond_1

    :cond_1
    const-wide/16 v3, 0x5

    invoke-static {v3, v4}, Landroid/os/SystemClock;->sleep(J)V

    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .end local v9           #event2:Landroid/view/MotionEvent;
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    const/4 v5, 0x1

    move/from16 v0, p3

    int-to-float v6, v0

    move/from16 v0, p4

    int-to-float v7, v0

    const/4 v8, 0x1

    invoke-static/range {v1 .. v8}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v10

    .local v10, event3:Landroid/view/MotionEvent;
    const/16 v3, 0x1002

    invoke-virtual {v10, v3}, Landroid/view/MotionEvent;->setSource(I)V

    invoke-static {}, Landroid/hardware/input/InputManager;->getInstance()Landroid/hardware/input/InputManager;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v3, v10, v4}, Landroid/hardware/input/InputManager;->injectInputEvent(Landroid/view/InputEvent;I)Z

    move-result v3

    and-int/2addr v12, v3

    return v12
.end method

.method private swipeFirst(IIIII)Z
    .locals 18
    .parameter "downX"
    .parameter "downY"
    .parameter "upX"
    .parameter "upY"
    .parameter "steps"

    .prologue
    const/4 v12, 0x0

    .local v12, ret:Z
    move/from16 v13, p5

    .local v13, swipeSteps:I
    const-wide/16 v14, 0x0

    .local v14, xStep:D
    const-wide/16 v16, 0x0

    .local v16, yStep:D
    const-wide/16 v1, 0x0

    .local v1, downTime:J
    if-nez v13, :cond_0

    const/4 v13, 0x1

    :cond_0
    sub-int v3, p3, p1

    int-to-double v3, v3

    int-to-double v5, v13

    div-double v14, v3, v5

    sub-int v3, p4, p2

    int-to-double v3, v3

    int-to-double v5, v13

    div-double v16, v3, v5

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    const/4 v5, 0x0

    move/from16 v0, p1

    int-to-float v6, v0

    move/from16 v0, p2

    int-to-float v7, v0

    const/4 v8, 0x1

    move-wide v3, v1

    invoke-static/range {v1 .. v8}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v9

    .local v9, event1:Landroid/view/MotionEvent;
    const/16 v3, 0x1002

    invoke-virtual {v9, v3}, Landroid/view/MotionEvent;->setSource(I)V

    invoke-static {}, Landroid/hardware/input/InputManager;->getInstance()Landroid/hardware/input/InputManager;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v3, v9, v4}, Landroid/hardware/input/InputManager;->injectInputEvent(Landroid/view/InputEvent;I)Z

    move-result v12

    const/4 v11, 0x1

    .local v11, i:I
    :goto_0
    if-ge v11, v13, :cond_1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    const/4 v5, 0x2

    int-to-double v6, v11

    mul-double/2addr v6, v14

    double-to-int v6, v6

    add-int v6, v6, p1

    int-to-float v6, v6

    int-to-double v7, v11

    mul-double v7, v7, v16

    double-to-int v7, v7

    add-int v7, v7, p2

    int-to-float v7, v7

    const/4 v8, 0x1

    invoke-static/range {v1 .. v8}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v10

    .local v10, event2:Landroid/view/MotionEvent;
    const/16 v3, 0x1002

    invoke-virtual {v10, v3}, Landroid/view/MotionEvent;->setSource(I)V

    invoke-static {}, Landroid/hardware/input/InputManager;->getInstance()Landroid/hardware/input/InputManager;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v3, v10, v4}, Landroid/hardware/input/InputManager;->injectInputEvent(Landroid/view/InputEvent;I)Z

    move-result v3

    and-int/2addr v12, v3

    const-wide/16 v3, 0x5

    invoke-static {v3, v4}, Landroid/os/SystemClock;->sleep(J)V

    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    .end local v10           #event2:Landroid/view/MotionEvent;
    :cond_1
    return v12
.end method

.method private swipeMiddle(IIIII)Z
    .locals 16
    .parameter "downX"
    .parameter "downY"
    .parameter "upX"
    .parameter "upY"
    .parameter "steps"

    .prologue
    const/4 v10, 0x0

    .local v10, ret:Z
    move/from16 v11, p5

    .local v11, swipeSteps:I
    const-wide/16 v12, 0x0

    .local v12, xStep:D
    const-wide/16 v14, 0x0

    .local v14, yStep:D
    const-wide/16 v0, 0x0

    .local v0, downTime:J
    if-nez v11, :cond_0

    const/4 v11, 0x1

    :cond_0
    sub-int v2, p3, p1

    int-to-double v2, v2

    int-to-double v4, v11

    div-double v12, v2, v4

    sub-int v2, p4, p2

    int-to-double v2, v2

    int-to-double v4, v11

    div-double v14, v2, v4

    const/4 v9, 0x1

    .local v9, i:I
    :goto_0
    if-ge v9, v11, :cond_1

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    const/4 v4, 0x2

    int-to-double v5, v9

    mul-double/2addr v5, v12

    double-to-int v5, v5

    add-int v5, v5, p1

    int-to-float v5, v5

    int-to-double v6, v9

    mul-double/2addr v6, v14

    double-to-int v6, v6

    add-int v6, v6, p2

    int-to-float v6, v6

    const/4 v7, 0x1

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v8

    .local v8, event2:Landroid/view/MotionEvent;
    const/16 v2, 0x1002

    invoke-virtual {v8, v2}, Landroid/view/MotionEvent;->setSource(I)V

    invoke-static {}, Landroid/hardware/input/InputManager;->getInstance()Landroid/hardware/input/InputManager;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v8, v3}, Landroid/hardware/input/InputManager;->injectInputEvent(Landroid/view/InputEvent;I)Z

    move-result v2

    and-int/2addr v10, v2

    const-wide/16 v2, 0x5

    invoke-static {v2, v3}, Landroid/os/SystemClock;->sleep(J)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .end local v8           #event2:Landroid/view/MotionEvent;
    :cond_1
    return v10
.end method

.method private swipeRelease(II)Z
    .locals 10
    .parameter "upX"
    .parameter "upY"

    .prologue
    const/4 v4, 0x1

    const-string v2, "hanchuang"

    const-string v3, "swipeRelease"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v9, 0x0

    .local v9, ret:Z
    const-wide/16 v0, 0x0

    .local v0, downTime:J
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    int-to-float v5, p1

    int-to-float v6, p2

    move v7, v4

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v8

    .local v8, event3:Landroid/view/MotionEvent;
    const/16 v2, 0x1002

    invoke-virtual {v8, v2}, Landroid/view/MotionEvent;->setSource(I)V

    invoke-static {}, Landroid/hardware/input/InputManager;->getInstance()Landroid/hardware/input/InputManager;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v8, v3}, Landroid/hardware/input/InputManager;->injectInputEvent(Landroid/view/InputEvent;I)Z

    move-result v2

    and-int/2addr v9, v2

    return v9
.end method

.method private unregisterVolleyListener()V
    .locals 2

    .prologue
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyRegistered:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyDetector:Lnubia/gesture/sensor/MotionDetector;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyListener:Lnubia/gesture/sensor/MotionListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyDetector:Lnubia/gesture/sensor/MotionDetector;

    iget-object v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyListener:Lnubia/gesture/sensor/MotionListener;

    invoke-virtual {v0, v1}, Lnubia/gesture/sensor/MotionDetector;->unregisterListener(Lnubia/gesture/sensor/MotionListener;)V

    const-string v0, "VolleyGestureCtrl"

    const-string v1, "unregisterVolley"

    invoke-static {v0, v1}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyRegistered:Z

    :cond_0
    return-void
.end method


# virtual methods
.method public registerSettingsObserver(Landroid/content/ContentResolver;Landroid/database/ContentObserver;)V
    .locals 3
    .parameter "resolver"
    .parameter "observer"

    .prologue
    const/4 v2, 0x0

    const/4 v1, -0x1

    const-string v0, "slide_screen"

    invoke-static {v0}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, v0, v2, p2, v1}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    const-string v0, "volley_white_list"

    invoke-static {v0}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, v0, v2, p2, v1}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;I)V

    return-void
.end method

.method public updatePackageChanged(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .parameter "clazzName"
    .parameter "pkgName"

    .prologue
    iget v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyRegistered:Z

    if-eqz v0, :cond_1

    invoke-direct {p0, p1, p2}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->filterVolleyApp(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->unregisterVolleyListener()V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->filterVolleyApp(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->registerVolleyListener()V

    goto :goto_0
.end method

.method public updateSettings()V
    .locals 5

    .prologue
    const/4 v4, -0x2

    const-string v1, "hanchuang"

    const-string v2, "volley updateSettings"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "slide_screen"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3, v4}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v0

    .local v0, volley:I
    iget v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyMode:I

    if-eq v1, v0, :cond_0

    iput v0, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyMode:I

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->enableVolleyGesture()V

    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "volley_white_list"

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$System;->getStringForUser(Landroid/content/ContentResolver;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->mVolleyFilter:Ljava/lang/String;

    return-void

    :cond_1
    invoke-direct {p0}, Lcom/android/internal/policy/impl/VolleyGestureCtrl;->disableVolleyGesture()V

    goto :goto_0
.end method
