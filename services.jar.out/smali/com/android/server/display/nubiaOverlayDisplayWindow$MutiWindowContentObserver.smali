.class Lcom/android/server/display/nubiaOverlayDisplayWindow$MutiWindowContentObserver;
.super Landroid/database/ContentObserver;
.source "nubiaOverlayDisplayWindow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/display/nubiaOverlayDisplayWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MutiWindowContentObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/display/nubiaOverlayDisplayWindow;


# direct methods
.method public constructor <init>(Lcom/android/server/display/nubiaOverlayDisplayWindow;Landroid/os/Handler;)V
    .locals 0
    .parameter
    .parameter "handler"

    .prologue
    iput-object p1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow$MutiWindowContentObserver;->this$0:Lcom/android/server/display/nubiaOverlayDisplayWindow;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method observe()V
    .locals 3

    .prologue
    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow$MutiWindowContentObserver;->this$0:Lcom/android/server/display/nubiaOverlayDisplayWindow;

    #getter for: Lcom/android/server/display/nubiaOverlayDisplayWindow;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->access$1900(Lcom/android/server/display/nubiaOverlayDisplayWindow;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .local v0, resolver:Landroid/content/ContentResolver;
    const-string v1, "ss_multi_window_enabled"

    invoke-static {v1}, Landroid/provider/Settings$System;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow$MutiWindowContentObserver;->this$0:Lcom/android/server/display/nubiaOverlayDisplayWindow;

    invoke-virtual {v1}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->updateSUMode()V

    return-void
.end method

.method public onChange(Z)V
    .locals 1
    .parameter "selfChange"

    .prologue
    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow$MutiWindowContentObserver;->this$0:Lcom/android/server/display/nubiaOverlayDisplayWindow;

    invoke-virtual {v0}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->updateSUMode()V

    return-void
.end method

.method unobserve()V
    .locals 2

    .prologue
    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow$MutiWindowContentObserver;->this$0:Lcom/android/server/display/nubiaOverlayDisplayWindow;

    #getter for: Lcom/android/server/display/nubiaOverlayDisplayWindow;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->access$1900(Lcom/android/server/display/nubiaOverlayDisplayWindow;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .local v0, resolver:Landroid/content/ContentResolver;
    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    return-void
.end method
