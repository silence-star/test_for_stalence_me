.class public Lcom/android/internal/policy/impl/BreathingLightCtrl;
.super Ljava/lang/Object;
.source "BreathingLightCtrl.java"

# interfaces
.implements Lcom/android/internal/policy/impl/IKeyBeforeDispatchingHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/policy/impl/BreathingLightCtrl$1;,
        Lcom/android/internal/policy/impl/BreathingLightCtrl$BreathLightHandler;,
        Lcom/android/internal/policy/impl/BreathingLightCtrl$BreathLightPointerEventListener;
    }
.end annotation


# static fields
.field private static final BREATHLIGHT_OFF:I = 0x1

.field private static final BREATHLIGHT_ON:I


# instance fields
.field private buttonLightFlag:I

.field private mBreathLightHandler:Lcom/android/internal/policy/impl/BreathingLightCtrl$BreathLightHandler;

.field private mBreathLightPointerEventListener:Lcom/android/internal/policy/impl/BreathingLightCtrl$BreathLightPointerEventListener;

.field private mBreathLightThread:Landroid/os/HandlerThread;

.field private mWindowManagerFuncs:Landroid/view/WindowManagerPolicy$WindowManagerFuncs;


# direct methods
.method constructor <init>(Landroid/view/WindowManagerPolicy$WindowManagerFuncs;)V
    .locals 1
    .parameter "windowManagerFuncs"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/android/internal/policy/impl/BreathingLightCtrl;->buttonLightFlag:I

    iput-object p1, p0, Lcom/android/internal/policy/impl/BreathingLightCtrl;->mWindowManagerFuncs:Landroid/view/WindowManagerPolicy$WindowManagerFuncs;

    invoke-direct {p0}, Lcom/android/internal/policy/impl/BreathingLightCtrl;->initBreathLightEvent()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/internal/policy/impl/BreathingLightCtrl;)Lcom/android/internal/policy/impl/BreathingLightCtrl$BreathLightHandler;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/internal/policy/impl/BreathingLightCtrl;->mBreathLightHandler:Lcom/android/internal/policy/impl/BreathingLightCtrl$BreathLightHandler;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/internal/policy/impl/BreathingLightCtrl;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/internal/policy/impl/BreathingLightCtrl;->turnButtonKeyLightOffDelay()V

    return-void
.end method

.method static synthetic access$300(Lcom/android/internal/policy/impl/BreathingLightCtrl;)I
    .locals 1
    .parameter "x0"

    .prologue
    iget v0, p0, Lcom/android/internal/policy/impl/BreathingLightCtrl;->buttonLightFlag:I

    return v0
.end method

.method private initBreathLightEvent()V
    .locals 2

    .prologue
    new-instance v0, Lcom/android/internal/policy/impl/BreathingLightCtrl$BreathLightPointerEventListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/internal/policy/impl/BreathingLightCtrl$BreathLightPointerEventListener;-><init>(Lcom/android/internal/policy/impl/BreathingLightCtrl;Lcom/android/internal/policy/impl/BreathingLightCtrl$1;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/BreathingLightCtrl;->mBreathLightPointerEventListener:Lcom/android/internal/policy/impl/BreathingLightCtrl$BreathLightPointerEventListener;

    iget-object v0, p0, Lcom/android/internal/policy/impl/BreathingLightCtrl;->mWindowManagerFuncs:Landroid/view/WindowManagerPolicy$WindowManagerFuncs;

    iget-object v1, p0, Lcom/android/internal/policy/impl/BreathingLightCtrl;->mBreathLightPointerEventListener:Lcom/android/internal/policy/impl/BreathingLightCtrl$BreathLightPointerEventListener;

    invoke-interface {v0, v1}, Landroid/view/WindowManagerPolicy$WindowManagerFuncs;->registerPointerEventListener(Landroid/view/WindowManagerPolicy$PointerEventListener;)V

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "BreathLightTouchEvent"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/BreathingLightCtrl;->mBreathLightThread:Landroid/os/HandlerThread;

    iget-object v0, p0, Lcom/android/internal/policy/impl/BreathingLightCtrl;->mBreathLightThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    new-instance v0, Lcom/android/internal/policy/impl/BreathingLightCtrl$BreathLightHandler;

    iget-object v1, p0, Lcom/android/internal/policy/impl/BreathingLightCtrl;->mBreathLightThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/android/internal/policy/impl/BreathingLightCtrl$BreathLightHandler;-><init>(Lcom/android/internal/policy/impl/BreathingLightCtrl;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/android/internal/policy/impl/BreathingLightCtrl;->mBreathLightHandler:Lcom/android/internal/policy/impl/BreathingLightCtrl$BreathLightHandler;

    return-void
.end method

.method private turnButtonKeyLightOffDelay()V
    .locals 4

    .prologue
    iget v1, p0, Lcom/android/internal/policy/impl/BreathingLightCtrl;->buttonLightFlag:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/android/internal/policy/impl/BreathingLightCtrl;->buttonLightFlag:I

    iget v1, p0, Lcom/android/internal/policy/impl/BreathingLightCtrl;->buttonLightFlag:I

    const v2, 0x7fffffff

    if-ne v1, v2, :cond_0

    const/4 v1, 0x0

    iput v1, p0, Lcom/android/internal/policy/impl/BreathingLightCtrl;->buttonLightFlag:I

    :cond_0
    iget-object v1, p0, Lcom/android/internal/policy/impl/BreathingLightCtrl;->mBreathLightHandler:Lcom/android/internal/policy/impl/BreathingLightCtrl$BreathLightHandler;

    invoke-virtual {v1}, Lcom/android/internal/policy/impl/BreathingLightCtrl$BreathLightHandler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    .local v0, message:Landroid/os/Message;
    const/4 v1, 0x1

    iput v1, v0, Landroid/os/Message;->what:I

    iget v1, p0, Lcom/android/internal/policy/impl/BreathingLightCtrl;->buttonLightFlag:I

    iput v1, v0, Landroid/os/Message;->arg1:I

    iget-object v1, p0, Lcom/android/internal/policy/impl/BreathingLightCtrl;->mBreathLightHandler:Lcom/android/internal/policy/impl/BreathingLightCtrl$BreathLightHandler;

    const-wide/16 v2, 0x5dc

    invoke-virtual {v1, v0, v2, v3}, Lcom/android/internal/policy/impl/BreathingLightCtrl$BreathLightHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    return-void
.end method


# virtual methods
.method public interceptKeyBeforeDispatching(Landroid/view/WindowManagerPolicy$WindowState;Landroid/view/KeyEvent;I)J
    .locals 4
    .parameter "win"
    .parameter "event"
    .parameter "policyFlags"

    .prologue
    const/4 v3, 0x3

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    .local v0, keyCode:I
    if-eq v0, v3, :cond_0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    const/16 v1, 0x52

    if-eq v0, v1, :cond_0

    const/16 v1, 0x54

    if-ne v0, v1, :cond_1

    :cond_0
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    const/16 v1, 0x38

    invoke-static {v3, v1}, Landroid/os/nubia/breathlight/BreathinglightManager;->updateBreathLightStatus(II)V

    invoke-direct {p0}, Lcom/android/internal/policy/impl/BreathingLightCtrl;->turnButtonKeyLightOffDelay()V

    :cond_1
    const-wide/high16 v1, -0x8000

    return-wide v1
.end method
