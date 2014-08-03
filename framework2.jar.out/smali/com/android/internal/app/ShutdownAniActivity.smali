.class public Lcom/android/internal/app/ShutdownAniActivity;
.super Landroid/app/Activity;
.source "ShutdownAniActivity.java"


# static fields
.field public static mPlayAnimationComplete:Z


# instance fields
.field private TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/internal/app/ShutdownAniActivity;->mPlayAnimationComplete:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const-class v0, Lcom/android/internal/app/ShutdownAniActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/app/ShutdownAniActivity;->TAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .parameter "savedInstanceState"

    .prologue
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/android/internal/app/ShutdownAniActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/high16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    const-string v0, "ctl.start"

    const-string v1, "shutdownanim"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
