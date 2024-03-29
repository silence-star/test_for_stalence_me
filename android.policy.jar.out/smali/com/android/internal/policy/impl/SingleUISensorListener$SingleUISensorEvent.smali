.class final Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;
.super Ljava/lang/Object;
.source "SingleUISensorListener.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/SingleUISensorListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SingleUISensorEvent"
.end annotation


# instance fields
.field private mActivityManager:Landroid/app/ActivityManager;

.field private mBlackAppList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mCloseTime:J

.field private mContext:Landroid/content/Context;

.field private mDisplaySize:Ljava/lang/String;

.field private mIsOpen:Z

.field private mLastTiltAngleX:I

.field private mLastValueX:F

.field private mMoveState:I

.field private mOpenTime:J

.field private mThresholdCloseValueX:F

.field private mThresholdMinValueY:F

.field private mThresholdOpenValueX:F


# direct methods
.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .parameter "context"
    .parameter "displaySize"
    .parameter "blStr"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mDisplaySize:Ljava/lang/String;

    invoke-static {p3}, Lcom/android/internal/policy/impl/SingleUISensorListener;->string2list(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mBlackAppList:Ljava/util/ArrayList;

    const-string v0, "activity"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    iput-object v0, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mActivityManager:Landroid/app/ActivityManager;

    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/android/internal/policy/impl/SingleUISensorListener$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"
    .parameter "x3"

    .prologue
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static currentAppIsInBlackList(Landroid/app/ActivityManager;Ljava/util/ArrayList;)Z
    .locals 4
    .parameter "activityManager"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/ActivityManager;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .local p1, blackList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, flag:Z
    #calls: Lcom/android/internal/policy/impl/SingleUISensorListener;->getCurrentRuningApp(Landroid/app/ActivityManager;)Landroid/app/ActivityManager$RecentTaskInfo;
    invoke-static {p0}, Lcom/android/internal/policy/impl/SingleUISensorListener;->access$200(Landroid/app/ActivityManager;)Landroid/app/ActivityManager$RecentTaskInfo;

    move-result-object v1

    .local v1, info:Landroid/app/ActivityManager$RecentTaskInfo;
    const-string v2, ""

    .local v2, pkg:Ljava/lang/String;
    iget-object v3, v1, Landroid/app/ActivityManager$RecentTaskInfo;->baseIntent:Landroid/content/Intent;

    if-eqz v3, :cond_0

    iget-object v3, v1, Landroid/app/ActivityManager$RecentTaskInfo;->baseIntent:Landroid/content/Intent;

    invoke-virtual {v3}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v3

    if-eqz v3, :cond_0

    iget-object v3, v1, Landroid/app/ActivityManager$RecentTaskInfo;->baseIntent:Landroid/content/Intent;

    invoke-virtual {v3}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v2

    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method private initTilteAngles()V
    .locals 9

    .prologue
    const v8, 0x411ce80a

    const-wide v2, 0x3fe65718468741a1L

    .local v2, openRadian:D
    const-wide v6, 0x3fe65718468741a1L

    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    double-to-float v6, v6

    mul-float/2addr v6, v8

    iput v6, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mThresholdOpenValueX:F

    const-wide v0, 0x3fd65718468741a1L

    .local v0, closeRadian:D
    const-wide v6, 0x3fd65718468741a1L

    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    double-to-float v6, v6

    mul-float/2addr v6, v8

    iput v6, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mThresholdCloseValueX:F

    const-wide v4, -0x4039a8e7b978be5fL

    .local v4, tilteRadian:D
    const-wide v6, -0x4039a8e7b978be5fL

    invoke-static {v6, v7}, Ljava/lang/Math;->sin(D)D

    move-result-wide v6

    double-to-float v6, v6

    mul-float/2addr v6, v8

    iput v6, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mThresholdMinValueY:F

    return-void
.end method

.method private openSingleUI(Landroid/content/Context;ILjava/lang/String;)V
    .locals 4
    .parameter "context"
    .parameter "moveState"
    .parameter "displaySize"

    .prologue
    const/4 v3, 0x1

    if-ne p2, v3, :cond_0

    const-string v0, "left"

    .local v0, positonStr:Ljava/lang/String;
    :goto_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "nubia_overlay_display_devices_left_right"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Global;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "nubia_overlay_display_devices"

    invoke-static {v1, v2, p3}, Landroid/provider/Settings$Global;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    iput p2, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mMoveState:I

    iput-boolean v3, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mIsOpen:Z

    return-void

    .end local v0           #positonStr:Ljava/lang/String;
    :cond_0
    const-string v0, "right"

    goto :goto_0
.end method

.method private reverseActionSingleUIByAccelerometer(Landroid/hardware/SensorEvent;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 11
    .parameter "event"
    .parameter "displaySize"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/SensorEvent;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, blackList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/16 v10, -0xa

    const/16 v9, -0x14

    const/16 v8, -0x28

    const/4 v6, 0x0

    const/4 v5, 0x1

    #calls: Lcom/android/internal/policy/impl/SingleUISensorListener;->calcTiltAngle(ILandroid/hardware/SensorEvent;)I
    invoke-static {v6, p1}, Lcom/android/internal/policy/impl/SingleUISensorListener;->access$100(ILandroid/hardware/SensorEvent;)I

    move-result v3

    .local v3, tiltAngleX:I
    if-lez v3, :cond_2

    move v0, v5

    .local v0, moveState:I
    :goto_0
    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_1
    iput v3, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastTiltAngleX:I

    :cond_1
    :goto_2
    return-void

    .end local v0           #moveState:I
    :cond_2
    move v0, v6

    goto :goto_0

    .restart local v0       #moveState:I
    :pswitch_0
    iget-boolean v6, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mIsOpen:Z

    if-nez v6, :cond_4

    const/16 v6, 0x28

    if-le v3, v6, :cond_4

    iget v6, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastTiltAngleX:I

    const/16 v7, 0x28

    if-le v6, v7, :cond_4

    iget v6, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastTiltAngleX:I

    if-le v3, v6, :cond_4

    #calls: Lcom/android/internal/policy/impl/SingleUISensorListener;->calcTiltAngle(ILandroid/hardware/SensorEvent;)I
    invoke-static {v5, p1}, Lcom/android/internal/policy/impl/SingleUISensorListener;->access$100(ILandroid/hardware/SensorEvent;)I

    move-result v4

    .local v4, tiltAngleY:I
    if-le v4, v10, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .local v1, openTime:J
    iget-wide v6, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mCloseTime:J

    sub-long v6, v1, v6

    const-wide/16 v8, 0x1f4

    cmp-long v6, v6, v8

    if-ltz v6, :cond_1

    iget-object v6, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mActivityManager:Landroid/app/ActivityManager;

    invoke-static {v6, p3}, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->currentAppIsInBlackList(Landroid/app/ActivityManager;Ljava/util/ArrayList;)Z

    move-result v6

    if-eqz v6, :cond_3

    iput-wide v1, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mCloseTime:J

    iput v3, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastTiltAngleX:I

    goto :goto_2

    :cond_3
    iget-object v6, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mContext:Landroid/content/Context;

    invoke-direct {p0, v6, v5, p2}, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->openSingleUI(Landroid/content/Context;ILjava/lang/String;)V

    iput-wide v1, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mOpenTime:J

    goto :goto_1

    .end local v1           #openTime:J
    .end local v4           #tiltAngleY:I
    :cond_4
    iget-boolean v5, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mIsOpen:Z

    if-eqz v5, :cond_0

    iget v5, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mMoveState:I

    if-eq v5, v0, :cond_0

    const/16 v5, 0x14

    if-le v3, v5, :cond_0

    iget v5, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastTiltAngleX:I

    const/16 v6, 0x14

    if-le v5, v6, :cond_0

    iget v5, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastTiltAngleX:I

    if-le v3, v5, :cond_0

    iget-object v5, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v5}, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->closeSingleUI(Landroid/content/Context;)V

    goto :goto_1

    :pswitch_1
    iget-boolean v7, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mIsOpen:Z

    if-nez v7, :cond_6

    if-ge v3, v8, :cond_6

    iget v7, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastTiltAngleX:I

    if-ge v7, v8, :cond_6

    iget v7, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastTiltAngleX:I

    if-ge v3, v7, :cond_6

    #calls: Lcom/android/internal/policy/impl/SingleUISensorListener;->calcTiltAngle(ILandroid/hardware/SensorEvent;)I
    invoke-static {v5, p1}, Lcom/android/internal/policy/impl/SingleUISensorListener;->access$100(ILandroid/hardware/SensorEvent;)I

    move-result v4

    .restart local v4       #tiltAngleY:I
    if-le v4, v10, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v1

    .restart local v1       #openTime:J
    iget-wide v7, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mCloseTime:J

    sub-long v7, v1, v7

    const-wide/16 v9, 0x1f4

    cmp-long v5, v7, v9

    if-ltz v5, :cond_1

    iget-object v5, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mActivityManager:Landroid/app/ActivityManager;

    invoke-static {v5, p3}, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->currentAppIsInBlackList(Landroid/app/ActivityManager;Ljava/util/ArrayList;)Z

    move-result v5

    if-eqz v5, :cond_5

    iput-wide v1, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mCloseTime:J

    iput v3, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastTiltAngleX:I

    goto/16 :goto_2

    :cond_5
    iget-object v5, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mContext:Landroid/content/Context;

    invoke-direct {p0, v5, v6, p2}, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->openSingleUI(Landroid/content/Context;ILjava/lang/String;)V

    iput-wide v1, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mOpenTime:J

    goto/16 :goto_1

    .end local v1           #openTime:J
    .end local v4           #tiltAngleY:I
    :cond_6
    iget-boolean v5, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mIsOpen:Z

    if-eqz v5, :cond_0

    iget v5, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mMoveState:I

    if-eq v5, v0, :cond_0

    if-ge v3, v9, :cond_0

    iget v5, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastTiltAngleX:I

    if-ge v5, v9, :cond_0

    iget v5, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastTiltAngleX:I

    if-le v5, v3, :cond_0

    iget-object v5, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v5}, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->closeSingleUI(Landroid/content/Context;)V

    goto/16 :goto_1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private reverseActionSingleUIByGravity(Landroid/hardware/SensorEvent;Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 12
    .parameter "event"
    .parameter "displaySize"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/hardware/SensorEvent;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, blackList:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v8, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v9, 0x0

    aget v7, v8, v9

    .local v7, valueX:F
    const/4 v8, 0x0

    cmpl-float v8, v7, v8

    if-lez v8, :cond_2

    const/4 v2, 0x1

    .local v2, moveState:I
    :goto_0
    packed-switch v2, :pswitch_data_0

    :cond_0
    :goto_1
    iput v7, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastValueX:F

    :cond_1
    :goto_2
    return-void

    .end local v2           #moveState:I
    :cond_2
    const/4 v2, 0x0

    goto :goto_0

    .restart local v2       #moveState:I
    :pswitch_0
    iget-boolean v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mIsOpen:Z

    if-nez v8, :cond_4

    iget v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mThresholdOpenValueX:F

    cmpl-float v8, v7, v8

    if-lez v8, :cond_4

    iget v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastValueX:F

    iget v9, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mThresholdOpenValueX:F

    cmpl-float v8, v8, v9

    if-lez v8, :cond_4

    iget v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastValueX:F

    sub-float v8, v7, v8

    const/4 v9, 0x0

    cmpl-float v8, v8, v9

    if-lez v8, :cond_4

    iget-object v8, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v9, 0x1

    aget v6, v8, v9

    .local v6, uOpenValueY:F
    iget v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mThresholdMinValueY:F

    cmpl-float v8, v6, v8

    if-lez v8, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    .local v3, openTime:J
    iget-wide v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mCloseTime:J

    sub-long v8, v3, v8

    const-wide/16 v10, 0x1f4

    cmp-long v8, v8, v10

    if-ltz v8, :cond_1

    iget-object v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mActivityManager:Landroid/app/ActivityManager;

    invoke-static {v8, p3}, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->currentAppIsInBlackList(Landroid/app/ActivityManager;Ljava/util/ArrayList;)Z

    move-result v8

    if-eqz v8, :cond_3

    iput-wide v3, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mCloseTime:J

    iput v7, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastValueX:F

    goto :goto_2

    :cond_3
    iget-object v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mContext:Landroid/content/Context;

    const/4 v9, 0x1

    invoke-direct {p0, v8, v9, p2}, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->openSingleUI(Landroid/content/Context;ILjava/lang/String;)V

    iput-wide v3, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mOpenTime:J

    goto :goto_1

    .end local v3           #openTime:J
    .end local v6           #uOpenValueY:F
    :cond_4
    iget-boolean v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mIsOpen:Z

    if-eqz v8, :cond_0

    iget v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mMoveState:I

    if-eq v8, v2, :cond_0

    iget v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mThresholdCloseValueX:F

    cmpl-float v8, v7, v8

    if-lez v8, :cond_0

    iget v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastValueX:F

    iget v9, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mThresholdCloseValueX:F

    cmpg-float v8, v8, v9

    if-gez v8, :cond_0

    iget-object v8, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v9, 0x1

    aget v5, v8, v9

    .local v5, uCloseValueY:F
    iget v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mThresholdMinValueY:F

    cmpl-float v8, v5, v8

    if-lez v8, :cond_0

    iget-object v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v8}, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->closeSingleUI(Landroid/content/Context;)V

    goto :goto_1

    .end local v5           #uCloseValueY:F
    :pswitch_1
    iget-boolean v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mIsOpen:Z

    if-nez v8, :cond_6

    iget v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mThresholdOpenValueX:F

    neg-float v8, v8

    cmpg-float v8, v7, v8

    if-gez v8, :cond_6

    iget v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastValueX:F

    iget v9, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mThresholdOpenValueX:F

    neg-float v9, v9

    cmpg-float v8, v8, v9

    if-gez v8, :cond_6

    iget v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastValueX:F

    sub-float v8, v7, v8

    const/4 v9, 0x0

    cmpg-float v8, v8, v9

    if-gez v8, :cond_6

    iget-object v8, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v9, 0x1

    aget v1, v8, v9

    .local v1, dOpenvalueY:F
    iget v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mThresholdMinValueY:F

    cmpl-float v8, v1, v8

    if-lez v8, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    .restart local v3       #openTime:J
    iget-wide v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mCloseTime:J

    sub-long v8, v3, v8

    const-wide/16 v10, 0x1f4

    cmp-long v8, v8, v10

    if-ltz v8, :cond_1

    iget-object v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mActivityManager:Landroid/app/ActivityManager;

    invoke-static {v8, p3}, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->currentAppIsInBlackList(Landroid/app/ActivityManager;Ljava/util/ArrayList;)Z

    move-result v8

    if-eqz v8, :cond_5

    iput-wide v3, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mCloseTime:J

    iput v7, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastValueX:F

    goto/16 :goto_2

    :cond_5
    iget-object v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mContext:Landroid/content/Context;

    const/4 v9, 0x0

    invoke-direct {p0, v8, v9, p2}, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->openSingleUI(Landroid/content/Context;ILjava/lang/String;)V

    iput-wide v3, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mOpenTime:J

    goto/16 :goto_1

    .end local v1           #dOpenvalueY:F
    .end local v3           #openTime:J
    :cond_6
    iget-boolean v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mIsOpen:Z

    if-eqz v8, :cond_0

    iget v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mMoveState:I

    if-eq v8, v2, :cond_0

    iget v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastValueX:F

    iget v9, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mThresholdCloseValueX:F

    neg-float v9, v9

    cmpg-float v8, v8, v9

    if-gez v8, :cond_0

    iget v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mLastTiltAngleX:I

    int-to-float v8, v8

    iget v9, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mThresholdCloseValueX:F

    neg-float v9, v9

    cmpl-float v8, v8, v9

    if-lez v8, :cond_0

    iget-object v8, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v9, 0x1

    aget v0, v8, v9

    .local v0, dClosevalueY:F
    iget v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mThresholdMinValueY:F

    cmpl-float v8, v0, v8

    if-lez v8, :cond_0

    iget-object v8, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mContext:Landroid/content/Context;

    invoke-virtual {p0, v8}, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->closeSingleUI(Landroid/content/Context;)V

    goto/16 :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method closeSingleUI(Landroid/content/Context;)V
    .locals 6
    .parameter "context"

    .prologue
    const-string v2, "SingleUISensorListener"

    const-string v3, "close single UI"

    invoke-static {v2, v3}, Landroid/util/Slog;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v2, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mIsOpen:Z

    if-nez v2, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    .local v0, closeTime:J
    iget-wide v2, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mOpenTime:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x1f4

    cmp-long v2, v2, v4

    if-ltz v2, :cond_0

    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mIsOpen:Z

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "nubia_overlay_display_devices"

    const-string v4, ""

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$Global;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    iput-wide v0, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mCloseTime:J

    goto :goto_0
.end method

.method public getScreenState()Z
    .locals 1

    .prologue
    iget-boolean v0, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mIsOpen:Z

    return v0
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .parameter "sensor"
    .parameter "accuracy"

    .prologue
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 2
    .parameter "event"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mDisplaySize:Ljava/lang/String;

    iget-object v1, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mBlackAppList:Ljava/util/ArrayList;

    invoke-direct {p0, p1, v0, v1}, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->reverseActionSingleUIByAccelerometer(Landroid/hardware/SensorEvent;Ljava/lang/String;Ljava/util/ArrayList;)V

    return-void
.end method

.method public setDisplayCloseStatus()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mIsOpen:Z

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mCloseTime:J

    return-void
.end method

.method public setDisplaySize(Ljava/lang/String;)V
    .locals 0
    .parameter "displaySize"

    .prologue
    iput-object p1, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mDisplaySize:Ljava/lang/String;

    return-void
.end method

.method public updateBlackList(Ljava/lang/String;)V
    .locals 1
    .parameter "blackList"

    .prologue
    invoke-static {p1}, Lcom/android/internal/policy/impl/SingleUISensorListener;->string2list(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/policy/impl/SingleUISensorListener$SingleUISensorEvent;->mBlackAppList:Ljava/util/ArrayList;

    return-void
.end method
