.class Lcom/android/internal/policy/impl/NubiaGlobalActions$3;
.super Ljava/lang/Object;
.source "NubiaGlobalActions.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/internal/policy/impl/NubiaGlobalActions;->setAllClickListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/policy/impl/NubiaGlobalActions;


# direct methods
.method constructor <init>(Lcom/android/internal/policy/impl/NubiaGlobalActions;)V
    .locals 0
    .parameter

    .prologue
    iput-object p1, p0, Lcom/android/internal/policy/impl/NubiaGlobalActions$3;->this$0:Lcom/android/internal/policy/impl/NubiaGlobalActions;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 13
    .parameter "v"

    .prologue
    const/4 v12, 0x2

    const/4 v7, 0x1

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/android/internal/policy/impl/NubiaGlobalActions$3;->this$0:Lcom/android/internal/policy/impl/NubiaGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/NubiaGlobalActions;->mContext:Landroid/content/Context;
    invoke-static {v9}, Lcom/android/internal/policy/impl/NubiaGlobalActions;->access$100(Lcom/android/internal/policy/impl/NubiaGlobalActions;)Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    .local v3, resolver:Landroid/content/ContentResolver;
    iget-object v9, p0, Lcom/android/internal/policy/impl/NubiaGlobalActions$3;->this$0:Lcom/android/internal/policy/impl/NubiaGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/NubiaGlobalActions;->mContext:Landroid/content/Context;
    invoke-static {v9}, Lcom/android/internal/policy/impl/NubiaGlobalActions;->access$100(Lcom/android/internal/policy/impl/NubiaGlobalActions;)Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    const-string v10, "nb_silent_mode"

    invoke-static {v9, v10, v8}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v9

    if-eqz v9, :cond_0

    move v4, v7

    .local v4, silentOn:Z
    :goto_0
    iget-object v9, p0, Lcom/android/internal/policy/impl/NubiaGlobalActions$3;->this$0:Lcom/android/internal/policy/impl/NubiaGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/NubiaGlobalActions;->mContext:Landroid/content/Context;
    invoke-static {v9}, Lcom/android/internal/policy/impl/NubiaGlobalActions;->access$100(Lcom/android/internal/policy/impl/NubiaGlobalActions;)Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v9

    const-string v10, "nb_vibrate_when_silent"

    invoke-static {v9, v10, v8}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v9

    if-eqz v9, :cond_1

    move v5, v7

    .local v5, vibrateOn:Z
    :goto_1
    iget-object v9, p0, Lcom/android/internal/policy/impl/NubiaGlobalActions$3;->this$0:Lcom/android/internal/policy/impl/NubiaGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/NubiaGlobalActions;->mContext:Landroid/content/Context;
    invoke-static {v9}, Lcom/android/internal/policy/impl/NubiaGlobalActions;->access$100(Lcom/android/internal/policy/impl/NubiaGlobalActions;)Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v10

    const-string v11, "nb_silent_mode"

    if-nez v4, :cond_2

    move v9, v7

    :goto_2
    invoke-static {v10, v11, v9}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    if-eqz v4, :cond_4

    iget-object v8, p0, Lcom/android/internal/policy/impl/NubiaGlobalActions$3;->this$0:Lcom/android/internal/policy/impl/NubiaGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/NubiaGlobalActions;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v8}, Lcom/android/internal/policy/impl/NubiaGlobalActions;->access$200(Lcom/android/internal/policy/impl/NubiaGlobalActions;)Landroid/media/AudioManager;

    move-result-object v8

    invoke-virtual {v8, v12}, Landroid/media/AudioManager;->getLastAudibleStreamVolume(I)I

    move-result v8

    if-nez v8, :cond_3

    if-eqz v5, :cond_3

    iget-object v8, p0, Lcom/android/internal/policy/impl/NubiaGlobalActions$3;->this$0:Lcom/android/internal/policy/impl/NubiaGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/NubiaGlobalActions;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v8}, Lcom/android/internal/policy/impl/NubiaGlobalActions;->access$200(Lcom/android/internal/policy/impl/NubiaGlobalActions;)Landroid/media/AudioManager;

    move-result-object v8

    invoke-virtual {v8, v7}, Landroid/media/AudioManager;->setRingerMode(I)V

    :goto_3
    iget-object v7, p0, Lcom/android/internal/policy/impl/NubiaGlobalActions$3;->this$0:Lcom/android/internal/policy/impl/NubiaGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/NubiaGlobalActions;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v7}, Lcom/android/internal/policy/impl/NubiaGlobalActions;->access$200(Lcom/android/internal/policy/impl/NubiaGlobalActions;)Landroid/media/AudioManager;

    move-result-object v7

    invoke-virtual {v7}, Landroid/media/AudioManager;->getRingerMode()I

    move-result v6

    .local v6, vibratorModeOn:I
    if-nez v6, :cond_6

    iget-object v7, p0, Lcom/android/internal/policy/impl/NubiaGlobalActions$3;->this$0:Lcom/android/internal/policy/impl/NubiaGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/NubiaGlobalActions;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v7}, Lcom/android/internal/policy/impl/NubiaGlobalActions;->access$200(Lcom/android/internal/policy/impl/NubiaGlobalActions;)Landroid/media/AudioManager;

    move-result-object v7

    invoke-virtual {v7, v12}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v0

    .local v0, currentRingVolume:I
    iget-object v7, p0, Lcom/android/internal/policy/impl/NubiaGlobalActions$3;->this$0:Lcom/android/internal/policy/impl/NubiaGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/NubiaGlobalActions;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v7}, Lcom/android/internal/policy/impl/NubiaGlobalActions;->access$200(Lcom/android/internal/policy/impl/NubiaGlobalActions;)Landroid/media/AudioManager;

    move-result-object v7

    invoke-virtual {v7, v12}, Landroid/media/AudioManager;->getStreamMaxVolume(I)I

    move-result v1

    .local v1, maxRingVolume:I
    mul-int/lit8 v7, v0, 0x64

    div-int v2, v7, v1

    .local v2, powerVolume:I
    const-string v7, "GlobalActions"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "mSilentLayout onClick powerVolume is "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "persist.sys.power.volume"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, ""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .end local v0           #currentRingVolume:I
    .end local v1           #maxRingVolume:I
    .end local v2           #powerVolume:I
    :goto_4
    iget-object v7, p0, Lcom/android/internal/policy/impl/NubiaGlobalActions$3;->this$0:Lcom/android/internal/policy/impl/NubiaGlobalActions;

    #calls: Lcom/android/internal/policy/impl/NubiaGlobalActions;->setRingerModeView()V
    invoke-static {v7}, Lcom/android/internal/policy/impl/NubiaGlobalActions;->access$300(Lcom/android/internal/policy/impl/NubiaGlobalActions;)V

    iget-object v7, p0, Lcom/android/internal/policy/impl/NubiaGlobalActions$3;->this$0:Lcom/android/internal/policy/impl/NubiaGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/NubiaGlobalActions;->mDialog:Lcom/android/internal/policy/impl/NubiaGlobalActions$GlobalActionsDialog;
    invoke-static {v7}, Lcom/android/internal/policy/impl/NubiaGlobalActions;->access$400(Lcom/android/internal/policy/impl/NubiaGlobalActions;)Lcom/android/internal/policy/impl/NubiaGlobalActions$GlobalActionsDialog;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/internal/policy/impl/NubiaGlobalActions$GlobalActionsDialog;->dismiss()V

    return-void

    .end local v4           #silentOn:Z
    .end local v5           #vibrateOn:Z
    .end local v6           #vibratorModeOn:I
    :cond_0
    move v4, v8

    goto/16 :goto_0

    .restart local v4       #silentOn:Z
    :cond_1
    move v5, v8

    goto/16 :goto_1

    .restart local v5       #vibrateOn:Z
    :cond_2
    move v9, v8

    goto/16 :goto_2

    :cond_3
    iget-object v7, p0, Lcom/android/internal/policy/impl/NubiaGlobalActions$3;->this$0:Lcom/android/internal/policy/impl/NubiaGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/NubiaGlobalActions;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v7}, Lcom/android/internal/policy/impl/NubiaGlobalActions;->access$200(Lcom/android/internal/policy/impl/NubiaGlobalActions;)Landroid/media/AudioManager;

    move-result-object v7

    invoke-virtual {v7, v12}, Landroid/media/AudioManager;->setRingerMode(I)V

    goto :goto_3

    :cond_4
    if-eqz v5, :cond_5

    iget-object v8, p0, Lcom/android/internal/policy/impl/NubiaGlobalActions$3;->this$0:Lcom/android/internal/policy/impl/NubiaGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/NubiaGlobalActions;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v8}, Lcom/android/internal/policy/impl/NubiaGlobalActions;->access$200(Lcom/android/internal/policy/impl/NubiaGlobalActions;)Landroid/media/AudioManager;

    move-result-object v8

    invoke-virtual {v8, v7}, Landroid/media/AudioManager;->setRingerMode(I)V

    goto/16 :goto_3

    :cond_5
    iget-object v7, p0, Lcom/android/internal/policy/impl/NubiaGlobalActions$3;->this$0:Lcom/android/internal/policy/impl/NubiaGlobalActions;

    #getter for: Lcom/android/internal/policy/impl/NubiaGlobalActions;->mAudioManager:Landroid/media/AudioManager;
    invoke-static {v7}, Lcom/android/internal/policy/impl/NubiaGlobalActions;->access$200(Lcom/android/internal/policy/impl/NubiaGlobalActions;)Landroid/media/AudioManager;

    move-result-object v7

    invoke-virtual {v7, v8}, Landroid/media/AudioManager;->setRingerMode(I)V

    goto/16 :goto_3

    .restart local v6       #vibratorModeOn:I
    :cond_6
    const-string v7, "GlobalActions"

    const-string v8, "mSilentLayout onClick silent"

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "persist.sys.power.volume"

    const-string v8, "0"

    invoke-static {v7, v8}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4
.end method
