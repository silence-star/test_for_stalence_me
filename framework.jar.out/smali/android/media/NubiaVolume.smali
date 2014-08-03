.class public Landroid/media/NubiaVolume;
.super Ljava/lang/Object;
.source "NubiaVolume.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "NubiaVolume"

.field private static final ZTEMT_SOUND_SCHEME:Z = true


# instance fields
.field private LAST_RINGER_MODE:Ljava/lang/String;

.field private VOLUME_CHANGED_WHEN_SILENT:Ljava/lang/String;

.field private mAffectStreamTypeByRingerModeForNubia:[I

.field private mAudioService:Landroid/media/AudioService;

.field private mContentResolver:Landroid/content/ContentResolver;

.field private mContext:Landroid/content/Context;

.field private mLastPersistMusicVolume:[I

.field private mLastPersistMusicVolumeName:[Ljava/lang/String;

.field private mLastRingerMode:I

.field private mLastSilentMode:I

.field private mPrevVolDirection:I

.field private mVolumeChangedWhenSilent:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/media/AudioService;)V
    .locals 4
    .parameter "context"
    .parameter "audioService"

    .prologue
    const/4 v1, 0x2

    const/4 v3, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "nb_volume_changed_when_slent"

    iput-object v0, p0, Landroid/media/NubiaVolume;->VOLUME_CHANGED_WHEN_SILENT:Ljava/lang/String;

    const-string v0, "nb_last_ringer_mode"

    iput-object v0, p0, Landroid/media/NubiaVolume;->LAST_RINGER_MODE:Ljava/lang/String;

    iput v3, p0, Landroid/media/NubiaVolume;->mVolumeChangedWhenSilent:I

    new-array v0, v1, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Landroid/media/NubiaVolume;->mAffectStreamTypeByRingerModeForNubia:[I

    new-array v0, v1, [Ljava/lang/String;

    const-string v1, "nb_stream_music_before_muted"

    aput-object v1, v0, v3

    const/4 v1, 0x1

    const-string v2, "nb_stream_system_before_muted"

    aput-object v2, v0, v1

    iput-object v0, p0, Landroid/media/NubiaVolume;->mLastPersistMusicVolumeName:[Ljava/lang/String;

    iput v3, p0, Landroid/media/NubiaVolume;->mPrevVolDirection:I

    iput-object p2, p0, Landroid/media/NubiaVolume;->mAudioService:Landroid/media/AudioService;

    iput-object p1, p0, Landroid/media/NubiaVolume;->mContext:Landroid/content/Context;

    iget-object v0, p0, Landroid/media/NubiaVolume;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Landroid/media/NubiaVolume;->mContentResolver:Landroid/content/ContentResolver;

    return-void

    :array_0
    .array-data 0x4
        0x3t 0x0t 0x0t 0x0t
        0x1t 0x0t 0x0t 0x0t
    .end array-data
.end method


# virtual methods
.method public getStreamVolume(ZI)I
    .locals 1
    .parameter "mute"
    .parameter "index"

    .prologue
    iget v0, p0, Landroid/media/NubiaVolume;->mVolumeChangedWhenSilent:I

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    const/4 p2, 0x0

    :cond_0
    add-int/lit8 v0, p2, 0x5

    div-int/lit8 v0, v0, 0xa

    return v0
.end method

.method public initStateForSilentMode()V
    .locals 9

    .prologue
    const/4 v8, 0x0

    const/4 v7, -0x2

    iget-object v5, p0, Landroid/media/NubiaVolume;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v6, p0, Landroid/media/NubiaVolume;->VOLUME_CHANGED_WHEN_SILENT:Ljava/lang/String;

    invoke-static {v5, v6, v8, v7}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v4

    .local v4, volumeChangedWhenSilent:I
    iget-object v5, p0, Landroid/media/NubiaVolume;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v6, p0, Landroid/media/NubiaVolume;->LAST_RINGER_MODE:Ljava/lang/String;

    invoke-static {v5, v6, v8, v7}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v2

    .local v2, lastRingerMode:I
    iget-object v5, p0, Landroid/media/NubiaVolume;->mContentResolver:Landroid/content/ContentResolver;

    const-string v6, "nb_silent_mode"

    invoke-static {v5, v6, v8, v7}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v3

    .local v3, lastSilentMode:I
    iget-object v5, p0, Landroid/media/NubiaVolume;->mLastPersistMusicVolumeName:[Ljava/lang/String;

    array-length v5, v5

    new-array v1, v5, [I

    .local v1, lastPersistMusicVolume:[I
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    iget-object v5, p0, Landroid/media/NubiaVolume;->mLastPersistMusicVolumeName:[Ljava/lang/String;

    array-length v5, v5

    if-ge v0, v5, :cond_0

    iget-object v5, p0, Landroid/media/NubiaVolume;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v6, p0, Landroid/media/NubiaVolume;->mLastPersistMusicVolumeName:[Ljava/lang/String;

    aget-object v6, v6, v0

    invoke-static {v5, v6, v8, v7}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v5

    aput v5, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iput v4, p0, Landroid/media/NubiaVolume;->mVolumeChangedWhenSilent:I

    iput v2, p0, Landroid/media/NubiaVolume;->mLastRingerMode:I

    iput-object v1, p0, Landroid/media/NubiaVolume;->mLastPersistMusicVolume:[I

    iput v3, p0, Landroid/media/NubiaVolume;->mLastSilentMode:I

    return-void
.end method

.method public nbCheckForRingerModeChange(III)Z
    .locals 6
    .parameter "oldIndex"
    .parameter "direction"
    .parameter "step"

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x1

    const/4 v5, -0x1

    const/4 v0, 0x1

    .local v0, adjustVolumeIndex:Z
    iget-object v4, p0, Landroid/media/NubiaVolume;->mAudioService:Landroid/media/AudioService;

    invoke-virtual {v4}, Landroid/media/AudioService;->getRingerMode()I

    move-result v1

    .local v1, ringerMode:I
    packed-switch v1, :pswitch_data_0

    const-string v3, "NubiaVolume"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "nbcheckForRingerModeChange() wrong ringer mode: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    :goto_0
    iget-object v3, p0, Landroid/media/NubiaVolume;->mAudioService:Landroid/media/AudioService;

    invoke-virtual {v3, v1}, Landroid/media/AudioService;->setRingerMode(I)V

    iput p2, p0, Landroid/media/NubiaVolume;->mPrevVolDirection:I

    return v0

    :pswitch_0
    if-ne p2, v5, :cond_0

    iget-object v4, p0, Landroid/media/NubiaVolume;->mContentResolver:Landroid/content/ContentResolver;

    const-string v5, "nb_vibrate_when_silent"

    invoke-static {v4, v5, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    if-ne v4, v2, :cond_1

    .local v2, vibrateInSilent:Z
    :goto_1
    if-gt p3, p1, :cond_2

    mul-int/lit8 v3, p3, 0x2

    if-ge p1, v3, :cond_2

    if-eqz v2, :cond_2

    iget-object v3, p0, Landroid/media/NubiaVolume;->mAudioService:Landroid/media/AudioService;

    invoke-virtual {v3}, Landroid/media/AudioService;->hasVibrator()Z

    move-result v3

    if-eqz v3, :cond_2

    const/4 v1, 0x1

    goto :goto_0

    .end local v2           #vibrateInSilent:Z
    :cond_1
    move v2, v3

    goto :goto_1

    .restart local v2       #vibrateInSilent:Z
    :cond_2
    if-ge p1, p3, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .end local v2           #vibrateInSilent:Z
    :pswitch_1
    iget v3, p0, Landroid/media/NubiaVolume;->mLastSilentMode:I

    if-eqz v3, :cond_3

    if-ge p1, p3, :cond_0

    if-ne p2, v5, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_3
    if-ne p2, v2, :cond_4

    const/4 v1, 0x2

    goto :goto_0

    :cond_4
    const/4 v0, 0x0

    goto :goto_0

    :pswitch_2
    if-ge p1, p3, :cond_0

    if-ne p2, v5, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public persistWhenRingerModeChange(I)V
    .locals 8
    .parameter "ringerMode"

    .prologue
    const/4 v7, -0x2

    const/4 v6, 0x0

    const/4 v5, 0x1

    iget-object v2, p0, Landroid/media/NubiaVolume;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v3, p0, Landroid/media/NubiaVolume;->VOLUME_CHANGED_WHEN_SILENT:Ljava/lang/String;

    iget v4, p0, Landroid/media/NubiaVolume;->mVolumeChangedWhenSilent:I

    invoke-static {v2, v3, v4, v7}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    iget-object v2, p0, Landroid/media/NubiaVolume;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v3, p0, Landroid/media/NubiaVolume;->LAST_RINGER_MODE:Ljava/lang/String;

    iget v4, p0, Landroid/media/NubiaVolume;->mLastRingerMode:I

    invoke-static {v2, v3, v4, v7}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    iget-object v2, p0, Landroid/media/NubiaVolume;->mContentResolver:Landroid/content/ContentResolver;

    const-string v3, "nb_silent_mode"

    invoke-static {v2, v3, v6}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    .local v1, silentMode:I
    if-eqz p1, :cond_0

    if-ne v5, v1, :cond_3

    if-ne p1, v5, :cond_3

    :cond_0
    if-nez p1, :cond_2

    iget-object v2, p0, Landroid/media/NubiaVolume;->mContentResolver:Landroid/content/ContentResolver;

    const-string v3, "nb_silent_mode"

    invoke-static {v2, v3, v5}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    iget-object v2, p0, Landroid/media/NubiaVolume;->mContentResolver:Landroid/content/ContentResolver;

    const-string v3, "nb_vibrate_when_silent"

    invoke-static {v2, v3, v6}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    :cond_1
    :goto_0
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget-object v2, p0, Landroid/media/NubiaVolume;->mLastPersistMusicVolume:[I

    array-length v2, v2

    if-ge v0, v2, :cond_4

    iget-object v2, p0, Landroid/media/NubiaVolume;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v3, p0, Landroid/media/NubiaVolume;->mLastPersistMusicVolumeName:[Ljava/lang/String;

    aget-object v3, v3, v0

    iget-object v4, p0, Landroid/media/NubiaVolume;->mLastPersistMusicVolume:[I

    aget v4, v4, v0

    invoke-static {v2, v3, v4, v7}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .end local v0           #i:I
    :cond_2
    if-ne p1, v5, :cond_1

    iget-object v2, p0, Landroid/media/NubiaVolume;->mContentResolver:Landroid/content/ContentResolver;

    const-string v3, "nb_vibrate_when_silent"

    invoke-static {v2, v3, v5}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_0

    :cond_3
    const/4 v2, 0x2

    if-ne p1, v2, :cond_5

    iget-object v2, p0, Landroid/media/NubiaVolume;->mContentResolver:Landroid/content/ContentResolver;

    const-string v3, "nb_silent_mode"

    invoke-static {v2, v3, v6}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    :cond_4
    :goto_2
    iget-object v2, p0, Landroid/media/NubiaVolume;->mContentResolver:Landroid/content/ContentResolver;

    const-string v3, "nb_silent_mode"

    invoke-static {v2, v3, v6}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    iput v2, p0, Landroid/media/NubiaVolume;->mLastSilentMode:I

    return-void

    :cond_5
    iget-object v2, p0, Landroid/media/NubiaVolume;->mContentResolver:Landroid/content/ContentResolver;

    const-string v3, "nb_vibrate_when_silent"

    invoke-static {v2, v3, v5}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    goto :goto_2
.end method

.method public ringerModeForStreamVolume(I)I
    .locals 5
    .parameter "index"

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x2

    .local v0, newRingerMode:I
    if-nez p1, :cond_2

    iget-object v2, p0, Landroid/media/NubiaVolume;->mContentResolver:Landroid/content/ContentResolver;

    const-string v3, "nb_vibrate_when_silent"

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v1, :cond_1

    iget-object v2, p0, Landroid/media/NubiaVolume;->mAudioService:Landroid/media/AudioService;

    invoke-virtual {v2}, Landroid/media/AudioService;->hasVibrator()Z

    move-result v2

    if-eqz v2, :cond_1

    move v0, v1

    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Landroid/media/NubiaVolume;->mAudioService:Landroid/media/AudioService;

    invoke-virtual {v1}, Landroid/media/AudioService;->getRingerMode()I

    move-result v0

    goto :goto_0

    :cond_2
    iget v2, p0, Landroid/media/NubiaVolume;->mLastSilentMode:I

    if-ne v2, v1, :cond_0

    iget-object v1, p0, Landroid/media/NubiaVolume;->mAudioService:Landroid/media/AudioService;

    invoke-virtual {v1}, Landroid/media/AudioService;->getRingerMode()I

    move-result v0

    goto :goto_0
.end method

.method public setFlagVolumeChangedWhenSilent(II)V
    .locals 1
    .parameter "changed"
    .parameter "streamType"

    .prologue
    const/4 v0, 0x2

    if-ne p2, v0, :cond_0

    iput p1, p0, Landroid/media/NubiaVolume;->mVolumeChangedWhenSilent:I

    :cond_0
    return-void
.end method

.method public silentModeChange()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    iget-object v2, p0, Landroid/media/NubiaVolume;->mContentResolver:Landroid/content/ContentResolver;

    const-string v3, "nb_silent_mode"

    invoke-static {v2, v3, v1}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .local v0, silentMode:I
    iget v2, p0, Landroid/media/NubiaVolume;->mLastSilentMode:I

    if-eq v2, v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method

.method public updateStateWhenRingerModeChange()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    iput v0, p0, Landroid/media/NubiaVolume;->mVolumeChangedWhenSilent:I

    iget-object v0, p0, Landroid/media/NubiaVolume;->mAudioService:Landroid/media/AudioService;

    invoke-virtual {v0}, Landroid/media/AudioService;->getRingerMode()I

    move-result v0

    iput v0, p0, Landroid/media/NubiaVolume;->mLastRingerMode:I

    return-void
.end method

.method public updateStreamVolume(ZII)V
    .locals 8
    .parameter "persist"
    .parameter "streamType"
    .parameter "ringerMode"

    .prologue
    const/4 v7, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz p1, :cond_3

    const/4 v5, 0x3

    if-eq p2, v5, :cond_0

    if-ne p2, v3, :cond_3

    :cond_0
    const/4 v1, 0x0

    .local v1, i:I
    if-ne p2, v3, :cond_1

    const/4 v1, 0x1

    :cond_1
    iget-object v5, p0, Landroid/media/NubiaVolume;->mAudioService:Landroid/media/AudioService;

    invoke-virtual {v5, p2, v7}, Landroid/media/AudioService;->getCurrentIndexForDevice(II)I

    move-result v0

    .local v0, currentIndex:I
    iget-object v5, p0, Landroid/media/NubiaVolume;->mContentResolver:Landroid/content/ContentResolver;

    const-string v6, "nb_silent_mode"

    invoke-static {v5, v6, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v5

    if-ne v5, v3, :cond_4

    move v2, v3

    .local v2, silentMode:Z
    :goto_0
    if-eq p3, v7, :cond_2

    if-nez v2, :cond_5

    if-ne p3, v3, :cond_5

    :cond_2
    if-nez v0, :cond_3

    iget-object v3, p0, Landroid/media/NubiaVolume;->mAudioService:Landroid/media/AudioService;

    iget-object v5, p0, Landroid/media/NubiaVolume;->mLastPersistMusicVolume:[I

    aget v5, v5, v1

    invoke-virtual {v3, p2, v7, v5, v4}, Landroid/media/AudioService;->setStreamVolumeForDevice(IIII)V

    .end local v0           #currentIndex:I
    .end local v1           #i:I
    .end local v2           #silentMode:Z
    :cond_3
    :goto_1
    return-void

    .restart local v0       #currentIndex:I
    .restart local v1       #i:I
    :cond_4
    move v2, v4

    goto :goto_0

    .restart local v2       #silentMode:Z
    :cond_5
    if-nez v2, :cond_6

    if-nez p3, :cond_3

    :cond_6
    iget v3, p0, Landroid/media/NubiaVolume;->mLastRingerMode:I

    if-eq v3, v7, :cond_7

    if-eqz v0, :cond_8

    :cond_7
    iget-object v3, p0, Landroid/media/NubiaVolume;->mLastPersistMusicVolume:[I

    aput v0, v3, v1

    :cond_8
    iget-object v3, p0, Landroid/media/NubiaVolume;->mAudioService:Landroid/media/AudioService;

    invoke-virtual {v3, p2, v7, v4, v4}, Landroid/media/AudioService;->setStreamVolumeForDevice(IIII)V

    goto :goto_1
.end method
