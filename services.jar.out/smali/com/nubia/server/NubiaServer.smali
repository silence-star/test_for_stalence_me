.class public Lcom/nubia/server/NubiaServer;
.super Ljava/lang/Object;
.source "NubiaServer.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "NubiaServer"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addClipService()V
    .locals 3

    .prologue
    const-string v1, "NubiaServer"

    const-string v2, "add nubia.clipserviceext Service"

    invoke-static {v1, v2}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/nubia/server/ClipServiceExtra;

    invoke-direct {v0}, Lcom/nubia/server/ClipServiceExtra;-><init>()V

    .local v0, clipService:Lcom/nubia/server/ClipServiceExtra;
    const-string v1, "nubia.clipserviceext"

    invoke-static {v1, v0}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V

    return-void
.end method

.method private static addCommonHelperService()V
    .locals 0

    .prologue
    return-void
.end method

.method public static addServices()V
    .locals 0

    .prologue
    invoke-static {}, Lcom/nubia/server/NubiaServer;->addClipService()V

    return-void
.end method
