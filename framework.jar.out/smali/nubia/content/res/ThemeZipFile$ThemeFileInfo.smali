.class public Lnubia/content/res/ThemeZipFile$ThemeFileInfo;
.super Ljava/lang/Object;
.source "ThemeZipFile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnubia/content/res/ThemeZipFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ThemeFileInfo"
.end annotation


# instance fields
.field public mDensity:I

.field public mInput:Ljava/io/InputStream;

.field public mSize:J

.field final synthetic this$0:Lnubia/content/res/ThemeZipFile;


# direct methods
.method constructor <init>(Lnubia/content/res/ThemeZipFile;Ljava/io/InputStream;J)V
    .locals 0
    .parameter
    .parameter "is"
    .parameter "size"

    .prologue
    iput-object p1, p0, Lnubia/content/res/ThemeZipFile$ThemeFileInfo;->this$0:Lnubia/content/res/ThemeZipFile;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lnubia/content/res/ThemeZipFile$ThemeFileInfo;->mInput:Ljava/io/InputStream;

    iput-wide p3, p0, Lnubia/content/res/ThemeZipFile$ThemeFileInfo;->mSize:J

    return-void
.end method
