.class Lcom/android/internal/policy/impl/SmartFaceManager$1;
.super Ljava/lang/Object;
.source "SmartFaceManager.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/policy/impl/SmartFaceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/SmartFaceManager;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/SmartFaceManager;)V
    .locals 0
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/internal/policy/impl/SmartFaceManager$1;->this$0:Lcom/android/internal/policy/impl/SmartFaceManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0
    .parameter "arg0"
    .parameter "arg1"

    .prologue
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 4
    .parameter "event"

    .prologue
    iget-object v2, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v3, 0x0

    aget v1, v2, v3

    .local v1, near:F
    iget-object v2, p0, Lcom/android/internal/policy/impl/SmartFaceManager$1;->this$0:Lcom/android/internal/policy/impl/SmartFaceManager;

    #getter for: Lcom/android/internal/policy/impl/SmartFaceManager;->mIsToggleOpen:Z
    invoke-static {v2}, Lcom/android/internal/policy/impl/SmartFaceManager;->access$000(Lcom/android/internal/policy/impl/SmartFaceManager;)Z

    move-result v2

    if-nez v2, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    const/high16 v2, 0x3f80

    cmpl-float v2, v1, v2

    if-nez v2, :cond_2

    :try_start_0
    const-string v2, "SmartFaceManager"

    const-string v3, "smart face near"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/android/internal/policy/impl/SmartFaceManager$1;->this$0:Lcom/android/internal/policy/impl/SmartFaceManager;

    #calls: Lcom/android/internal/policy/impl/SmartFaceManager;->doCloseLeather()V
    invoke-static {v2}, Lcom/android/internal/policy/impl/SmartFaceManager;->access$100(Lcom/android/internal/policy/impl/SmartFaceManager;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .local v0, exception:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .end local v0           #exception:Ljava/lang/Exception;
    :cond_2
    const/high16 v2, 0x4000

    cmpl-float v2, v1, v2

    if-nez v2, :cond_0

    :try_start_1
    const-string v2, "SmartFaceManager"

    const-string v3, "smart face far"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/android/internal/policy/impl/SmartFaceManager$1;->this$0:Lcom/android/internal/policy/impl/SmartFaceManager;

    #calls: Lcom/android/internal/policy/impl/SmartFaceManager;->doOpenLeather()V
    invoke-static {v2}, Lcom/android/internal/policy/impl/SmartFaceManager;->access$200(Lcom/android/internal/policy/impl/SmartFaceManager;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method
