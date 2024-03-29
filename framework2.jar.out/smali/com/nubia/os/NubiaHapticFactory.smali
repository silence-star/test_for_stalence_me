.class public Lcom/nubia/os/NubiaHapticFactory;
.super Ljava/lang/Object;
.source "NubiaHapticFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createNubiaHaptics()Lcom/nubia/os/INubiaHaptics;
    .locals 3

    .prologue
    invoke-static {}, Landroid/app/ActivityThread;->getPackageManager()Landroid/content/pm/IPackageManager;

    move-result-object v1

    .local v1, pm:Landroid/content/pm/IPackageManager;
    const/4 v0, 0x0

    .local v0, mHapticsSupported:Z
    if-nez v1, :cond_0

    :try_start_0
    const-string v2, "cn.nubia.hardware.haptic"

    invoke-interface {v1, v2}, Landroid/content/pm/IPackageManager;->hasSystemFeature(Ljava/lang/String;)Z
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    new-instance v2, Lcom/nubia/os/TiHaptics;

    invoke-direct {v2}, Lcom/nubia/os/TiHaptics;-><init>()V

    :goto_1
    return-object v2

    :cond_1
    new-instance v2, Lcom/nubia/os/DefaultHaptics;

    invoke-direct {v2}, Lcom/nubia/os/DefaultHaptics;-><init>()V

    goto :goto_1

    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method public static createNubiaHaptics(Landroid/content/Context;)Lcom/nubia/os/INubiaHaptics;
    .locals 3
    .parameter "context"

    .prologue
    const/4 v0, 0x0

    .local v0, mHapticsSupported:Z
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const-string v2, "cn.nubia.hardware.haptic"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v1, Lcom/nubia/os/TiHaptics;

    invoke-direct {v1, p0}, Lcom/nubia/os/TiHaptics;-><init>(Landroid/content/Context;)V

    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Lcom/nubia/os/DefaultHaptics;

    invoke-direct {v1, p0}, Lcom/nubia/os/DefaultHaptics;-><init>(Landroid/content/Context;)V

    goto :goto_0
.end method
