.class public Lcom/nubia/os/NubiaHaptic;
.super Ljava/lang/Object;
.source "NubiaHaptic.java"


# static fields
.field private static final DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "NubiaHaptic"


# instance fields
.field private final mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/nubia/os/NubiaHapticFactory;->createNubiaHaptics()Lcom/nubia/os/INubiaHaptics;

    move-result-object v0

    iput-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/nubia/os/NubiaHapticFactory;->createNubiaHaptics(Landroid/content/Context;)Lcom/nubia/os/INubiaHaptics;

    move-result-object v0

    iput-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    return-void
.end method

.method private log(Ljava/lang/String;)V
    .locals 1
    .parameter "s"

    .prologue
    const-string v0, "NubiaHaptic"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public clickButton()V
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    invoke-interface {v0}, Lcom/nubia/os/INubiaHaptics;->clickButton()V

    :cond_0
    return-void
.end method

.method public clickKey()V
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    invoke-interface {v0}, Lcom/nubia/os/INubiaHaptics;->clickKey()V

    :cond_0
    return-void
.end method

.method public hasVibrator()Z
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    invoke-interface {v0}, Lcom/nubia/os/INubiaHaptics;->hasVibrator()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public longPressBlank()V
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    invoke-interface {v0}, Lcom/nubia/os/INubiaHaptics;->longPressBlank()V

    :cond_0
    return-void
.end method

.method public longPressButton()V
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    invoke-interface {v0}, Lcom/nubia/os/INubiaHaptics;->longPressButton()V

    :cond_0
    return-void
.end method

.method public longPressKeyEnd()V
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    invoke-interface {v0}, Lcom/nubia/os/INubiaHaptics;->longPressKeyEnd()V

    :cond_0
    return-void
.end method

.method public longPressKeyStart()V
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    invoke-interface {v0}, Lcom/nubia/os/INubiaHaptics;->longPressKeyStart()V

    :cond_0
    return-void
.end method

.method public longPressTelButtonEnd()V
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    invoke-interface {v0}, Lcom/nubia/os/INubiaHaptics;->longPressTelButtonEnd()V

    :cond_0
    return-void
.end method

.method public longPressTelButtonStart()V
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    invoke-interface {v0}, Lcom/nubia/os/INubiaHaptics;->longPressTelButtonStart()V

    :cond_0
    return-void
.end method

.method public notificationVibrator1()V
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    invoke-interface {v0}, Lcom/nubia/os/INubiaHaptics;->notificationVibrator1()V

    :cond_0
    return-void
.end method

.method public notificationVibrator2()V
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    invoke-interface {v0}, Lcom/nubia/os/INubiaHaptics;->notificationVibrator2()V

    :cond_0
    return-void
.end method

.method public slideButtonEnd()V
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    invoke-interface {v0}, Lcom/nubia/os/INubiaHaptics;->slideButtonEnd()V

    :cond_0
    return-void
.end method

.method public slideButtonStart()V
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/nubia/os/NubiaHaptic;->mINubiaHaptics:Lcom/nubia/os/INubiaHaptics;

    invoke-interface {v0}, Lcom/nubia/os/INubiaHaptics;->slideButtonStart()V

    :cond_0
    return-void
.end method
