.class Lnubia/fancydrawable/TimeDrawable$1;
.super Ljava/lang/Object;
.source "TimeDrawable.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnubia/fancydrawable/TimeDrawable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lnubia/fancydrawable/TimeDrawable;


# direct methods
.method constructor <init>(Lnubia/fancydrawable/TimeDrawable;)V
    .locals 0
    .parameter

    .prologue
    iput-object p1, p0, Lnubia/fancydrawable/TimeDrawable$1;->this$0:Lnubia/fancydrawable/TimeDrawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    iget-object v2, p0, Lnubia/fancydrawable/TimeDrawable$1;->this$0:Lnubia/fancydrawable/TimeDrawable;

    invoke-virtual {v2}, Lnubia/fancydrawable/TimeDrawable;->invalidateSelf()V

    iget-object v2, p0, Lnubia/fancydrawable/TimeDrawable$1;->this$0:Lnubia/fancydrawable/TimeDrawable;

    iget-object v2, v2, Lnubia/fancydrawable/TimeDrawable;->mHandler:Landroid/os/Handler;

    if-eqz v2, :cond_0

    const/16 v1, 0x3c

    .local v1, second:I
    iget-object v2, p0, Lnubia/fancydrawable/TimeDrawable$1;->this$0:Lnubia/fancydrawable/TimeDrawable;

    #getter for: Lnubia/fancydrawable/TimeDrawable;->mCalendar:Landroid/text/format/Time;
    invoke-static {v2}, Lnubia/fancydrawable/TimeDrawable;->access$000(Lnubia/fancydrawable/TimeDrawable;)Landroid/text/format/Time;

    move-result-object v3

    monitor-enter v3

    :try_start_0
    iget-object v2, p0, Lnubia/fancydrawable/TimeDrawable$1;->this$0:Lnubia/fancydrawable/TimeDrawable;

    #getter for: Lnubia/fancydrawable/TimeDrawable;->mCalendar:Landroid/text/format/Time;
    invoke-static {v2}, Lnubia/fancydrawable/TimeDrawable;->access$000(Lnubia/fancydrawable/TimeDrawable;)Landroid/text/format/Time;

    move-result-object v2

    invoke-virtual {v2}, Landroid/text/format/Time;->setToNow()V

    iget-object v2, p0, Lnubia/fancydrawable/TimeDrawable$1;->this$0:Lnubia/fancydrawable/TimeDrawable;

    #getter for: Lnubia/fancydrawable/TimeDrawable;->mCalendar:Landroid/text/format/Time;
    invoke-static {v2}, Lnubia/fancydrawable/TimeDrawable;->access$000(Lnubia/fancydrawable/TimeDrawable;)Landroid/text/format/Time;

    move-result-object v2

    iget v1, v2, Landroid/text/format/Time;->second:I

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    rsub-int/lit8 v2, v1, 0x3c

    if-lez v2, :cond_1

    rsub-int/lit8 v0, v1, 0x3c

    .local v0, nexttime:I
    :goto_0
    iget-object v2, p0, Lnubia/fancydrawable/TimeDrawable$1;->this$0:Lnubia/fancydrawable/TimeDrawable;

    iget-object v2, v2, Lnubia/fancydrawable/TimeDrawable;->mHandler:Landroid/os/Handler;

    iget-object v3, p0, Lnubia/fancydrawable/TimeDrawable$1;->this$0:Lnubia/fancydrawable/TimeDrawable;

    #getter for: Lnubia/fancydrawable/TimeDrawable;->tickRunnable:Ljava/lang/Runnable;
    invoke-static {v3}, Lnubia/fancydrawable/TimeDrawable;->access$100(Lnubia/fancydrawable/TimeDrawable;)Ljava/lang/Runnable;

    move-result-object v3

    mul-int/lit16 v4, v0, 0x3e8

    int-to-long v4, v4

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .end local v0           #nexttime:I
    .end local v1           #second:I
    :cond_0
    return-void

    .restart local v1       #second:I
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    :cond_1
    const/16 v0, 0x3c

    goto :goto_0
.end method
