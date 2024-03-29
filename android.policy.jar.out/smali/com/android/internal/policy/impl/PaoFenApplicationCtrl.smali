.class public Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;
.super Ljava/lang/Object;
.source "PaoFenApplicationCtrl.java"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private sBenchmarkPackages:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .parameter "context"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "PaoFenApplicationCtrl"

    iput-object v0, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->TAG:Ljava/lang/String;

    iput-object p1, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->mContext:Landroid/content/Context;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->sBenchmarkPackages:Ljava/util/HashSet;

    iget-object v0, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->sBenchmarkPackages:Ljava/util/HashSet;

    const-string v1, "com.qihoo360.mobilesafe.bench"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->sBenchmarkPackages:Ljava/util/HashSet;

    const-string v1, "com.antutu.ABenchMark"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->sBenchmarkPackages:Ljava/util/HashSet;

    const-string v1, "ales.veluscek.sdtools"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->sBenchmarkPackages:Ljava/util/HashSet;

    const-string v1, "cn.opda.android.activity"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->sBenchmarkPackages:Ljava/util/HashSet;

    const-string v1, "com.antutu.CpuMaster"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->sBenchmarkPackages:Ljava/util/HashSet;

    const-string v1, "com.antutu.tester"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->sBenchmarkPackages:Ljava/util/HashSet;

    const-string v1, "com.antutu.ABenchMark.GL2"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->sBenchmarkPackages:Ljava/util/HashSet;

    const-string v1, "com.aurorasoftworks.quadrant.ui"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->sBenchmarkPackages:Ljava/util/HashSet;

    const-string v1, "com.domobile.esysteminfo"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->sBenchmarkPackages:Ljava/util/HashSet;

    const-string v1, "com.ludashi.benchmark"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->sBenchmarkPackages:Ljava/util/HashSet;

    const-string v1, "com.qihoo360.mobilesafe.opti"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->sBenchmarkPackages:Ljava/util/HashSet;

    const-string v1, "com.greenecomputing.linpack"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->sBenchmarkPackages:Ljava/util/HashSet;

    const-string v1, "eu.chainfire.cfbench"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->sBenchmarkPackages:Ljava/util/HashSet;

    const-string v1, "com.qualcomm.qx.neocore"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->sBenchmarkPackages:Ljava/util/HashSet;

    const-string v1, "com.into.stability"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->sBenchmarkPackages:Ljava/util/HashSet;

    const-string v1, "com.glbenchmark.glbenchmark"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->sBenchmarkPackages:Ljava/util/HashSet;

    const-string v1, "gr.androiddev.BenchmarkPi"

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public updatePackageChanged(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .parameter "clazzName"
    .parameter "pkgName"

    .prologue
    const-string v1, "sys.cpu.max_perf"

    const-string v2, "0"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .local v0, cpu_status:Ljava/lang/String;
    iget-object v1, p0, Lcom/android/internal/policy/impl/PaoFenApplicationCtrl;->sBenchmarkPackages:Ljava/util/HashSet;

    invoke-virtual {v1, p2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "1"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "sys.cpu.max_perf"

    const-string v2, "1"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    const-string v1, "0"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "sys.cpu.max_perf"

    const-string v2, "0"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
