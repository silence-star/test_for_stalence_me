.class Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl$1;
.super Ljava/lang/Object;
.source "TouchGestureFuncsCtrl.java"

# interfaces
.implements Lnubia/gesture/touch/GestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;->enableTouchGesture()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;)V
    .locals 0
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl$1;->this$0:Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGesture(Lnubia/gesture/touch/GestureArg;)Z
    .locals 3
    .parameter "arg"

    .prologue
    const/4 v0, 0x0

    .local v0, bHandled:Z
    instance-of v1, p1, Lnubia/gesture/touch/MultiPointArg;

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Lnubia/gesture/touch/GestureArg;->getType()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    return v0

    :pswitch_1
    const-string v1, "TouchGestureFuncsCtrl"

    const-string v2, "MultiPoint.MULTI_FINGER_UP"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v1, p0, Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl$1;->this$0:Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;

    #calls: Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;->takeSnot()V
    invoke-static {v1}, Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;->access$000(Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;)V

    const/4 v0, 0x1

    goto :goto_0

    :pswitch_2
    iget-object v1, p0, Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl$1;->this$0:Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;

    #getter for: Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;->mSwitchAppCtrl:Lcom/android/internal/policy/impl/MultiFingerSwitchAppCtrl;
    invoke-static {v1}, Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;->access$100(Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;)Lcom/android/internal/policy/impl/MultiFingerSwitchAppCtrl;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/android/internal/policy/impl/MultiFingerSwitchAppCtrl;->doSwitchApp(Z)V

    const/4 v0, 0x1

    goto :goto_0

    :pswitch_3
    iget-object v1, p0, Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl$1;->this$0:Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;

    #getter for: Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;->mSwitchAppCtrl:Lcom/android/internal/policy/impl/MultiFingerSwitchAppCtrl;
    invoke-static {v1}, Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;->access$100(Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;)Lcom/android/internal/policy/impl/MultiFingerSwitchAppCtrl;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/android/internal/policy/impl/MultiFingerSwitchAppCtrl;->doSwitchApp(Z)V

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    instance-of v1, p1, Lnubia/gesture/touch/PalmCoverArg;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl$1;->this$0:Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;

    #calls: Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;->doPalmCoverLockScreen()V
    invoke-static {v1}, Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;->access$200(Lcom/android/internal/policy/impl/TouchGestureFuncsCtrl;)V

    const/4 v0, 0x1

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method
