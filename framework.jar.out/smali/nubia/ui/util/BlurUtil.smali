.class public Lnubia/ui/util/BlurUtil;
.super Ljava/lang/Object;
.source "BlurUtil.java"


# static fields
.field private static final FIELD_WALLPAPER_PARAM:Ljava/lang/String; = "key_wallpaper_param"

.field private static final SCALE:F = 4.0f

.field private static final SEPATATOR:Ljava/lang/String; = ":"

.field private static final TAG:Ljava/lang/String; = "BlurUtil"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Landroid/content/Context;II)V
    .locals 0
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    invoke-static {p0, p1, p2}, Lnubia/ui/util/BlurUtil;->saveWallpaperParams(Landroid/content/Context;II)V

    return-void
.end method

.method static synthetic access$100(Landroid/content/Context;Landroid/graphics/Bitmap;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-static {p0, p1}, Lnubia/ui/util/BlurUtil;->doBlurWallpaper(Landroid/content/Context;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public static asyncSaveBlurWallpaper(Landroid/content/Context;Landroid/graphics/Bitmap;II)V
    .locals 3
    .parameter "context"
    .parameter "src"
    .parameter "w"
    .parameter "h"

    .prologue
    if-nez p1, :cond_0

    :goto_0
    return-void

    :cond_0
    const-string v1, "android.permission.WRITE_SETTINGS"

    invoke-static {p0, v1}, Lnubia/ui/util/BlurUtil;->checkCallingPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "BlurUtil"

    const-string v2, "no permission: android.permission.WRITE_SETTINGS"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    new-instance v0, Lnubia/ui/util/BlurUtil$1;

    invoke-direct {v0, p0, p2, p3, p1}, Lnubia/ui/util/BlurUtil$1;-><init>(Landroid/content/Context;IILandroid/graphics/Bitmap;)V

    .local v0, r:Ljava/lang/Runnable;
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    goto :goto_0
.end method

.method private static checkCallingPermission(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 2
    .parameter "context"
    .parameter "name"

    .prologue
    invoke-virtual {p0, p1}, Landroid/content/Context;->checkCallingOrSelfPermission(Ljava/lang/String;)I

    move-result v0

    .local v0, permission:I
    if-nez v0, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static clipWallpaper(Landroid/content/Context;Landroid/graphics/Rect;)Landroid/graphics/Bitmap;
    .locals 10
    .parameter "context"
    .parameter "rect"

    .prologue
    const/4 v9, 0x0

    const/4 v5, 0x0

    invoke-static {p0}, Lnubia/ui/util/BlurUtil;->isStaticWallpaper(Landroid/content/Context;)Z

    move-result v6

    if-nez v6, :cond_0

    move-object v2, v5

    :goto_0
    return-object v2

    :cond_0
    invoke-static {}, Lnubia/ui/util/BlurUtil;->getBlurWallpaper()Landroid/graphics/Bitmap;

    move-result-object v4

    .local v4, wallpaperDB:Landroid/graphics/Bitmap;
    if-nez v4, :cond_1

    const-string v6, "BlurUtil"

    const-string v7, "invoked method failured: getBlurWallpaper"

    invoke-static {v6, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, v5

    goto :goto_0

    :cond_1
    invoke-static {p0, p1}, Lnubia/ui/util/BlurUtil;->getScrollClipRect(Landroid/content/Context;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v3

    .local v3, scaleRect:Landroid/graphics/Rect;
    const/high16 v6, 0x3e80

    invoke-virtual {v3, v6}, Landroid/graphics/Rect;->scale(F)V

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v6

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v7

    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v6, v7, v8}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    .local v2, newBm:Landroid/graphics/Bitmap;
    new-instance v1, Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v6

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v7

    invoke-direct {v1, v9, v9, v6, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    .local v1, dst:Landroid/graphics/Rect;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .local v0, canvas:Landroid/graphics/Canvas;
    invoke-virtual {v0, v4, v3, v1, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    invoke-virtual {v0, v5}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0
.end method

.method public static doArcBitmap(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 11
    .parameter "context"
    .parameter "srcBmp"

    .prologue
    const/4 v10, 0x1

    new-instance v7, Landroid/graphics/Paint;

    invoke-direct {v7}, Landroid/graphics/Paint;-><init>()V

    .local v7, paint:Landroid/graphics/Paint;
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    .local v2, bmpWidth:I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    .local v1, bmpHeight:I
    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .local v3, canvas:Landroid/graphics/Canvas;
    const/4 v9, 0x0

    invoke-virtual {v3, v9}, Landroid/graphics/Canvas;->drawColor(I)V

    const v4, 0x424242

    .local v4, color:I
    const v9, 0x424242

    invoke-virtual {v7, v9}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v7, v10}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    invoke-virtual {v7, v10}, Landroid/graphics/Paint;->setDither(Z)V

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x10500a5

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    .local v0, arcHeight:F
    mul-int v9, v2, v2

    int-to-float v9, v9

    const/high16 v10, 0x3e00

    mul-float/2addr v9, v10

    div-float/2addr v9, v0

    add-float v8, v9, v0

    .local v8, radius:F
    int-to-float v9, v2

    const/high16 v10, 0x3f00

    mul-float v5, v9, v10

    .local v5, cx:F
    int-to-float v9, v1

    add-float/2addr v9, v8

    sub-float v6, v9, v0

    .local v6, cy:F
    new-instance v9, Landroid/graphics/PorterDuffXfermode;

    sget-object v10, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v9, v10}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v7, v9}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    invoke-virtual {v3, v5, v6, v8, v7}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    const/4 v9, 0x0

    invoke-virtual {v3, v9}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    return-object p1
.end method

.method private static doBlurWallpaper(Landroid/content/Context;Landroid/graphics/Bitmap;)V
    .locals 12
    .parameter "context"
    .parameter "wallpaper"

    .prologue
    const/4 v11, 0x0

    const/high16 v10, 0x4080

    const/4 v9, 0x0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    .local v7, w:I
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    .local v2, h:I
    int-to-float v8, v7

    div-float/2addr v8, v10

    float-to-int v5, v8

    .local v5, scaleWidth:I
    int-to-float v8, v2

    div-float/2addr v8, v10

    float-to-int v4, v8

    .local v4, scaleHeight:I
    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v5, v4, v8}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3

    .local v3, newBm:Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .local v0, canvas:Landroid/graphics/Canvas;
    new-instance v6, Landroid/graphics/Rect;

    invoke-direct {v6, v9, v9, v7, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    .local v6, srcRect:Landroid/graphics/Rect;
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1, v9, v9, v5, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .local v1, dstRect:Landroid/graphics/Rect;
    invoke-virtual {v0, p1, v6, v1, v11}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    invoke-virtual {v0, v11}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    const/4 v8, 0x1

    invoke-static {v3, v8}, Lnubia/ui/util/FastBlur;->doBlur(Landroid/graphics/Bitmap;Z)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-static {v3}, Lnubia/ui/util/BlurUtil;->saveBlurWallpaper(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method private static getBlurWallpaper()Landroid/graphics/Bitmap;
    .locals 4

    .prologue
    const/4 v0, 0x0

    .local v0, bitmap:Landroid/graphics/Bitmap;
    :try_start_0
    const-string v2, "window"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Landroid/view/IWindowManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IWindowManager;

    move-result-object v2

    invoke-interface {v2}, Landroid/view/IWindowManager;->getBlurWallpaper()Landroid/graphics/Bitmap;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    :goto_0
    return-object v0

    :catch_0
    move-exception v1

    .local v1, e:Landroid/os/RemoteException;
    const-string v2, "BlurUtil"

    const-string v3, "getBlurWallpaper:RemoteException"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static getScrollClipRect(Landroid/content/Context;Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 14
    .parameter "context"
    .parameter "src"

    .prologue
    const/4 v13, 0x1

    const/4 v12, 0x0

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .local v2, rect:Landroid/graphics/Rect;
    invoke-static {p0}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v9

    .local v9, wallpaperMgr:Landroid/app/WallpaperManager;
    invoke-virtual {v9}, Landroid/app/WallpaperManager;->getWallpaperXOffset()F

    move-result v0

    .local v0, offsetX:F
    invoke-virtual {v9}, Landroid/app/WallpaperManager;->getWallpaperYOffset()F

    move-result v1

    .local v1, offsetY:F
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v11

    iget v4, v11, Landroid/util/DisplayMetrics;->widthPixels:I

    .local v4, screenWidth:I
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v11

    iget v3, v11, Landroid/util/DisplayMetrics;->heightPixels:I

    .local v3, screenHeight:I
    invoke-virtual {v9}, Landroid/app/WallpaperManager;->getDesiredMinimumWidth()I

    move-result v8

    .local v8, wallpaperDesiredWidth:I
    invoke-virtual {v9}, Landroid/app/WallpaperManager;->getDesiredMinimumHeight()I

    move-result v7

    .local v7, wallpaperDesiredHeight:I
    const/4 v5, 0x0

    .local v5, scrollX:I
    const/4 v6, 0x0

    .local v6, scrollY:I
    const/4 v11, 0x0

    cmpg-float v11, v0, v11

    if-gez v11, :cond_2

    sub-int v11, v8, v4

    div-int/lit8 v5, v11, 0x2

    sub-int v11, v7, v3

    div-int/lit8 v6, v11, 0x2

    :goto_0
    if-gez v5, :cond_0

    const/4 v5, 0x0

    :cond_0
    if-gez v6, :cond_1

    const/4 v6, 0x0

    :cond_1
    invoke-virtual {v2, v5, v6}, Landroid/graphics/Rect;->offset(II)V

    return-object v2

    :cond_2
    const/4 v11, 0x2

    new-array v10, v11, [I

    .local v10, wallpaperParam:[I
    invoke-static {p0, v10}, Lnubia/ui/util/BlurUtil;->getWallpaperParam(Landroid/content/Context;[I)V

    aget v11, v10, v12

    if-eqz v11, :cond_3

    aget v8, v10, v12

    :cond_3
    aget v11, v10, v13

    if-eqz v11, :cond_4

    aget v7, v10, v13

    :cond_4
    sub-int v11, v8, v4

    int-to-float v11, v11

    mul-float/2addr v11, v0

    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v5

    sub-int v11, v7, v3

    int-to-float v11, v11

    mul-float/2addr v11, v1

    invoke-static {v11}, Ljava/lang/Math;->round(F)I

    move-result v6

    goto :goto_0
.end method

.method private static getWallpaperParam(Landroid/content/Context;[I)V
    .locals 6
    .parameter "context"
    .parameter "outParam"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "key_wallpaper_param"

    invoke-static {v2, v3}, Landroid/provider/Settings$System;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, value:Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, str:[Ljava/lang/String;
    aget-object v2, v0, v4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aput v2, p1, v4

    aget-object v2, v0, v5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aput v2, p1, v5

    .end local v0           #str:[Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private static isStaticWallpaper(Landroid/content/Context;)Z
    .locals 1
    .parameter "context"

    .prologue
    invoke-static {p0}, Landroid/app/WallpaperManager;->getInstance(Landroid/content/Context;)Landroid/app/WallpaperManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/WallpaperManager;->getWallpaperInfo()Landroid/app/WallpaperInfo;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static saveBlurWallpaper(Landroid/graphics/Bitmap;)V
    .locals 3
    .parameter "blurBitmap"

    .prologue
    :try_start_0
    const-string v1, "window"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Landroid/view/IWindowManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/view/IWindowManager;

    move-result-object v1

    invoke-interface {v1, p0}, Landroid/view/IWindowManager;->saveBlurWallpaper(Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "BlurUtil"

    const-string v2, "saveBlurWallpaper:RemoteException"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static saveWallpaperParams(Landroid/content/Context;II)V
    .locals 4
    .parameter "context"
    .parameter "w"
    .parameter "h"

    .prologue
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "key_wallpaper_param"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ":"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Landroid/provider/Settings$System;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    return-void
.end method
