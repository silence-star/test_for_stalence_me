.class public Lcom/android/server/am/SingleUIBlackAppHelper;
.super Ljava/lang/Object;
.source "SingleUIBlackAppHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/am/SingleUIBlackAppHelper$SettingsObserver;
    }
.end annotation


# static fields
.field private static final ACTION_BLACK_APP_START:Ljava/lang/String; = "android.intent.action.SINGLE_UI_BLACK_APP_START"

.field private static final DEFAULT_SU_BLACK_LIST:[Ljava/lang/String; = null

.field private static final FIELD_SINGLE_UI_MODE:Ljava/lang/String; = "single_ui_mode"

.field private static final FIELD_SU_BLACK_LIST:Ljava/lang/String; = "single_ui_black_list"

.field private static final SEPARATOR_APP_LIST:Ljava/lang/String; = "/"


# instance fields
.field private mBlackList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mBlackListStr:Ljava/lang/String;

.field private mContext:Landroid/content/Context;

.field private mHandler:Landroid/os/Handler;

.field private mHasSingleHand:Z

.field private mSingleMode:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "com.android.gallery3d"

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/server/am/SingleUIBlackAppHelper;->DEFAULT_SU_BLACK_LIST:[Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Landroid/os/Handler;Landroid/content/Context;)V
    .locals 3
    .parameter "handler"
    .parameter "context"

    .prologue
    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v1, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mSingleMode:I

    new-instance v0, Lcom/android/server/am/SingleUIBlackAppHelper$1;

    invoke-direct {v0, p0}, Lcom/android/server/am/SingleUIBlackAppHelper$1;-><init>(Lcom/android/server/am/SingleUIBlackAppHelper;)V

    iput-object v0, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mBlackList:Ljava/util/ArrayList;

    iput-boolean v1, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mHasSingleHand:Z

    const-string v0, "1"

    const-string v1, "persist.sys.singlehand"

    const-string v2, "0"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mHasSingleHand:Z

    iget-boolean v0, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mHasSingleHand:Z

    if-eqz v0, :cond_0

    iput-object p1, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mHandler:Landroid/os/Handler;

    iput-object p2, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mContext:Landroid/content/Context;

    invoke-direct {p0}, Lcom/android/server/am/SingleUIBlackAppHelper;->observe()V

    :cond_0
    return-void
.end method

.method static synthetic access$000()[Ljava/lang/String;
    .locals 1

    .prologue
    sget-object v0, Lcom/android/server/am/SingleUIBlackAppHelper;->DEFAULT_SU_BLACK_LIST:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/android/server/am/SingleUIBlackAppHelper;Landroid/content/Context;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/server/am/SingleUIBlackAppHelper;->updateSettings(Landroid/content/Context;)V

    return-void
.end method

.method private isInSUBlackList(Ljava/lang/String;)Z
    .locals 1
    .parameter "packageName"

    .prologue
    iget-object v0, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mBlackList:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mBlackList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private observe()V
    .locals 3

    .prologue
    iget-boolean v1, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mHasSingleHand:Z

    if-eqz v1, :cond_0

    new-instance v0, Lcom/android/server/am/SingleUIBlackAppHelper$SettingsObserver;

    iget-object v1, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mContext:Landroid/content/Context;

    invoke-direct {v0, p0, v1, v2}, Lcom/android/server/am/SingleUIBlackAppHelper$SettingsObserver;-><init>(Lcom/android/server/am/SingleUIBlackAppHelper;Landroid/os/Handler;Landroid/content/Context;)V

    .local v0, settingsObserver:Lcom/android/server/am/SingleUIBlackAppHelper$SettingsObserver;
    invoke-virtual {v0}, Lcom/android/server/am/SingleUIBlackAppHelper$SettingsObserver;->observe()V

    .end local v0           #settingsObserver:Lcom/android/server/am/SingleUIBlackAppHelper$SettingsObserver;
    :cond_0
    return-void
.end method

.method private static string2list(Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 5
    .parameter "str"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    const-string v4, "/"

    invoke-virtual {p0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, array:[Ljava/lang/String;
    array-length v2, v0

    .local v2, length:I
    const/4 v1, 0x0

    .local v1, i:I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(I)V

    .local v3, outputArray:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v4, v0, v1

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v3
.end method

.method private updateSettings(Landroid/content/Context;)V
    .locals 6
    .parameter "context"

    .prologue
    const/4 v5, -0x2

    iget-boolean v3, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mHasSingleHand:Z

    if-nez v3, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    .local v1, resolver:Landroid/content/ContentResolver;
    const-string v3, "single_ui_black_list"

    invoke-static {v1, v3, v5}, Landroid/provider/Settings$System;->getStringForUser(Landroid/content/ContentResolver;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    .local v0, blackList:Ljava/lang/String;
    if-eqz v0, :cond_2

    iget-object v3, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mBlackListStr:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    iput-object v0, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mBlackListStr:Ljava/lang/String;

    invoke-static {v0}, Lcom/android/server/am/SingleUIBlackAppHelper;->string2list(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    iput-object v3, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mBlackList:Ljava/util/ArrayList;

    :cond_2
    const-string v3, "single_ui_mode"

    const/4 v4, 0x0

    invoke-static {v1, v3, v4, v5}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v2

    .local v2, singleMode:I
    iget v3, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mSingleMode:I

    if-eq v3, v2, :cond_0

    iput v2, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mSingleMode:I

    goto :goto_0
.end method


# virtual methods
.method sendBroadcastForSUBlackAppsStart(Ljava/lang/String;)V
    .locals 3
    .parameter "packageName"

    .prologue
    iget-boolean v1, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mHasSingleHand:Z

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mSingleMode:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    invoke-direct {p0, p1}, Lcom/android/server/am/SingleUIBlackAppHelper;->isInSUBlackList(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SINGLE_UI_BLACK_APP_START"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .local v0, intent:Landroid/content/Intent;
    iget-object v1, p0, Lcom/android/server/am/SingleUIBlackAppHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .end local v0           #intent:Landroid/content/Intent;
    :cond_0
    return-void
.end method
