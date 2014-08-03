.class public Lnubia/content/res/IconCustomizer;
.super Ljava/lang/Object;
.source "IconCustomizer.java"


# static fields
.field private static final sAlphaShift:I = 0x18

.field private static sCache:Ljava/util/HashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/SoftReference",
            "<",
            "Landroid/graphics/Bitmap;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final sCanvas:Landroid/graphics/Canvas; = null

.field private static final sDensities:[I = null

.field private static sDensity:I = 0x0

.field private static sExcludeAll:Ljava/lang/Boolean; = null

.field private static sExcludes:Ljava/util/Set; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sIconHeight:I = 0x0

.field private static sIconMapping:Ljava/util/Map; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static sIconWidth:I = 0x0

.field private static final sOldBounds:Landroid/graphics/Rect; = null

.field private static final sPathPrefix:Ljava/lang/String; = "/data/system/theme/customized_icons/"

.field private static final sRGBMask:I = 0xffffff

.field private static final sSystemResource:Landroid/content/res/Resources;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/16 v3, 0x48

    const/4 v0, 0x1

    const/4 v1, 0x0

    sput v1, Lnubia/content/res/IconCustomizer;->sDensity:I

    sput v1, Lnubia/content/res/IconCustomizer;->sIconHeight:I

    sput v1, Lnubia/content/res/IconCustomizer;->sIconWidth:I

    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v2

    sput-object v2, Lnubia/content/res/IconCustomizer;->sSystemResource:Landroid/content/res/Resources;

    sget-object v2, Lnubia/content/res/IconCustomizer;->sSystemResource:Landroid/content/res/Resources;

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->densityDpi:I

    sput v2, Lnubia/content/res/IconCustomizer;->sDensity:I

    sget v2, Lnubia/content/res/IconCustomizer;->sDensity:I

    invoke-static {v2}, Lnubia/util/DisplayUtils;->getBestDensityOrder(I)[I

    move-result-object v2

    sput-object v2, Lnubia/content/res/IconCustomizer;->sDensities:[I

    invoke-static {v3}, Lnubia/content/res/IconCustomizer;->scalePixel(I)I

    move-result v2

    sput v2, Lnubia/content/res/IconCustomizer;->sIconWidth:I

    invoke-static {v3}, Lnubia/content/res/IconCustomizer;->scalePixel(I)I

    move-result v2

    sput v2, Lnubia/content/res/IconCustomizer;->sIconHeight:I

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    sput-object v2, Lnubia/content/res/IconCustomizer;->sOldBounds:Landroid/graphics/Rect;

    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2}, Landroid/graphics/Canvas;-><init>()V

    sput-object v2, Lnubia/content/res/IconCustomizer;->sCanvas:Landroid/graphics/Canvas;

    sget-object v2, Lnubia/content/res/IconCustomizer;->sCanvas:Landroid/graphics/Canvas;

    new-instance v3, Landroid/graphics/PaintFlagsDrawFilter;

    const/4 v4, 0x4

    const/4 v5, 0x2

    invoke-direct {v3, v4, v5}, Landroid/graphics/PaintFlagsDrawFilter;-><init>(II)V

    invoke-virtual {v2, v3}, Landroid/graphics/Canvas;->setDrawFilter(Landroid/graphics/DrawFilter;)V

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    sput-object v2, Lnubia/content/res/IconCustomizer;->sCache:Ljava/util/HashMap;

    const-string v2, "sys.ui.app-icon-background"

    invoke-static {v2, v0}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-eq v2, v0, :cond_0

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lnubia/content/res/IconCustomizer;->sExcludeAll:Ljava/lang/Boolean;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "com.nubia.mms.png"

    const-string v2, "com.android.mms.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "com.android.contacts.MmsConversationActivity.png"

    const-string v2, "com.android.mms.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "com.android.contacts.DialerActivity.png"

    const-string v2, "com.android.dialer.DialtactsActivity.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "com.android.video.png"

    const-string v2, "com.android.gallery3d.app.VideoBrowserActivity.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "cn.nubia.deskclock.preset#cn.nubia.deskclock.DeskClock.png"

    const-string v2, "com.android.timemanager.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "com.qihoo360.mobilesafe_zte.png"

    const-string v2, "com.qihoo360.mobilesafe.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "com.android.phone.png"

    const-string v2, "com.android.contacts.DialerActivity.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "cn.nubia.fmradio.preset#cn.nubia.fmradio.FMRadio.png"

    const-string v2, "com.nubia.quicinc.fmradio.FMRadio.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "cn.nubia.calendar.preset.png"

    const-string v2, "com.android.calendar2.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "cn.nubia.music.preset.png"

    const-string v2, "com.android.strengthenmusic.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "cn.nubia.security.png"

    const-string v2, "com.qihoo360.mobilesafe.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "com.android.settings.wfd.WifiDisplaySettingsActivity.png"

    const-string v2, "com.android.settings.Settings$WifiDisplaySettingsActivity.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "com.android.camera.CameraLauncher.png"

    const-string v2, "com.android.gallery3d#com.android.camera.CameraLauncher.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "cn.nubia.myfile.png"

    const-string v2, "com.mobile.mycloud.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "cn.nubia.notepad.preset.png"

    const-string v2, "com.ztemt.notepad.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "cn.nubia.v5light.preset.png"

    const-string v2, "com.android.v5light.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "cn.nubia.soundrecorder.preset.png"

    const-string v2, "com.nubia.soundrecorder.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "cn.nubia.databackup.png"

    const-string v2, "com.ztemt.databackup.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "cn.nubia.thememanager.png"

    const-string v2, "com.ztemt.thememanager.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "cn.nubia.quicksearchbox.png"

    const-string v2, "com.nubia.zquicksearchbox.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "cn.nubia.dlna.png"

    const-string v2, "com.nubia.dlna.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    const-string v1, "cn.nubia.calculator2.preset.png"

    const-string v2, "com.android.calculator2.png"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :cond_0
    move v0, v1

    goto/16 :goto_0
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clearCache()V
    .locals 2

    .prologue
    sget-object v1, Lnubia/content/res/IconCustomizer;->sExcludeAll:Ljava/lang/Boolean;

    monitor-enter v1

    const/4 v0, 0x0

    :try_start_0
    sput-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    sget-object v0, Lnubia/content/res/IconCustomizer;->sCache:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static clearCustomizedIcons(Ljava/lang/String;)V
    .locals 5
    .parameter "file"

    .prologue
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-string p0, "/data/system/theme/customized_icons/"

    :goto_0
    new-instance v2, Ljava/io/File;

    const-string v3, "/data/system/theme/customized_icons/"

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v2, iconsFolder:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v2}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .local v1, icons:[Ljava/io/File;
    if-eqz v1, :cond_2

    array-length v3, v1

    if-lez v3, :cond_2

    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    array-length v3, v1

    if-ge v0, v3, :cond_2

    aget-object v3, v1, v0

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    aget-object v3, v1, v0

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .end local v0           #i:I
    .end local v1           #icons:[Ljava/io/File;
    .end local v2           #iconsFolder:Ljava/io/File;
    :cond_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "/data/system/theme/customized_icons/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .restart local v2       #iconsFolder:Ljava/io/File;
    :cond_2
    return-void
.end method

.method private static composeIcon(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 15
    .parameter "bitmap"

    .prologue
    const/4 v9, 0x0

    const/4 v2, 0x0

    const/4 v14, 0x0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .local v3, width:I
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    .local v7, height:I
    mul-int v4, v3, v7

    new-array v1, v4, [I

    .local v1, pixels:[I
    move-object v0, p0

    move v4, v2

    move v5, v2

    move v6, v3

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    invoke-static {v3, v7, v1}, Lnubia/content/res/IconCustomizer;->cutEdge(II[I)V

    sget v4, Lnubia/content/res/IconCustomizer;->sIconWidth:I

    sget v5, Lnubia/content/res/IconCustomizer;->sIconHeight:I

    sget-object v6, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v4, v5, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v12

    .local v12, customBitmap:Landroid/graphics/Bitmap;
    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, v12}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .local v0, canvas:Landroid/graphics/Canvas;
    const-string v4, "icon_background.png"

    invoke-static {v4}, Lnubia/content/res/IconCustomizer;->getCachedThemeIcon(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v10

    .local v10, background:Landroid/graphics/Bitmap;
    if-eqz v10, :cond_0

    invoke-virtual {v0, v10, v14, v14, v9}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    :cond_0
    const-string v4, "icon_pattern.png"

    invoke-static {v4}, Lnubia/content/res/IconCustomizer;->getCachedThemeIcon(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v13

    .local v13, pattern:Landroid/graphics/Bitmap;
    if-eqz v13, :cond_1

    invoke-virtual {v0, v13, v14, v14, v9}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    :cond_1
    sget v4, Lnubia/content/res/IconCustomizer;->sIconWidth:I

    sub-int/2addr v4, v3

    div-int/lit8 v4, v4, 0x2

    sget v5, Lnubia/content/res/IconCustomizer;->sIconHeight:I

    sub-int/2addr v5, v7

    div-int/lit8 v5, v5, 0x2

    const/4 v8, 0x1

    move v6, v3

    invoke-virtual/range {v0 .. v9}, Landroid/graphics/Canvas;->drawBitmap([IIIIIIIZLandroid/graphics/Paint;)V

    const-string v2, "icon_border.png"

    invoke-static {v2}, Lnubia/content/res/IconCustomizer;->getCachedThemeIcon(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v11

    .local v11, border:Landroid/graphics/Bitmap;
    if-eqz v11, :cond_2

    invoke-virtual {v0, v11, v14, v14, v9}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    :cond_2
    return-object v12
.end method

.method private static cutEdge(II[I)V
    .locals 11
    .parameter "width"
    .parameter "height"
    .parameter "pixels"

    .prologue
    const-string v2, "icon_mask.png"

    invoke-static {v2}, Lnubia/content/res/IconCustomizer;->getCachedThemeIcon(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .local v0, iconMask:Landroid/graphics/Bitmap;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    .local v10, iconMaskWidth:I
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    .local v9, iconMaskHeight:I
    if-lt v10, p0, :cond_0

    if-lt v9, p1, :cond_0

    mul-int v2, v10, v9

    new-array v1, v2, [I

    .local v1, iconMaskPixels:[I
    const/4 v2, 0x0

    sub-int v3, v10, p0

    div-int/lit8 v4, v3, 0x2

    sub-int v3, v9, p1

    div-int/lit8 v5, v3, 0x2

    move v3, p0

    move v6, p0

    move v7, p1

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    mul-int v2, p0, p1

    add-int/lit8 v8, v2, -0x1

    .local v8, i:I
    :goto_0
    if-ltz v8, :cond_0

    aget v2, p2, v8

    const v3, 0xffffff

    aget v4, p2, v8

    ushr-int/lit8 v4, v4, 0x18

    aget v5, v1, v8

    ushr-int/lit8 v5, v5, 0x18

    mul-int/2addr v4, v5

    div-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x18

    add-int/2addr v3, v4

    and-int/2addr v2, v3

    aput v2, p2, v8

    add-int/lit8 v8, v8, -0x1

    goto :goto_0

    .end local v1           #iconMaskPixels:[I
    .end local v8           #i:I
    .end local v9           #iconMaskHeight:I
    .end local v10           #iconMaskWidth:I
    :cond_0
    return-void
.end method

.method private static drawableToBitmap(Landroid/graphics/drawable/Drawable;II)Landroid/graphics/Bitmap;
    .locals 14
    .parameter "drawable"
    .parameter "finalWidth"
    .parameter "finalHeight"

    .prologue
    sget-object v12, Lnubia/content/res/IconCustomizer;->sCanvas:Landroid/graphics/Canvas;

    monitor-enter v12

    move v3, p1

    .local v3, desiredWidth:I
    move/from16 v2, p2

    .local v2, desiredHeight:I
    :try_start_0
    instance-of v11, p0, Landroid/graphics/drawable/PaintDrawable;

    if-eqz v11, :cond_3

    move-object v0, p0

    check-cast v0, Landroid/graphics/drawable/PaintDrawable;

    move-object v8, v0

    .local v8, paintDrawable:Landroid/graphics/drawable/PaintDrawable;
    sget v11, Lnubia/content/res/IconCustomizer;->sIconWidth:I

    invoke-virtual {v8, v11}, Landroid/graphics/drawable/PaintDrawable;->setIntrinsicWidth(I)V

    sget v11, Lnubia/content/res/IconCustomizer;->sIconHeight:I

    invoke-virtual {v8, v11}, Landroid/graphics/drawable/PaintDrawable;->setIntrinsicHeight(I)V

    .end local v8           #paintDrawable:Landroid/graphics/drawable/PaintDrawable;
    :cond_0
    :goto_0
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v7

    .local v7, originalWidth:I
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v6

    .local v6, originalHeight:I
    if-lez v7, :cond_2

    if-lez v6, :cond_2

    if-ne v3, v7, :cond_1

    if-eq v2, v6, :cond_2

    :cond_1
    int-to-float v11, v7

    int-to-float v13, v6

    div-float v9, v11, v13

    .local v9, ratio:F
    if-le v7, v6, :cond_4

    int-to-float v11, v3

    div-float/2addr v11, v9

    float-to-int v2, v11

    .end local v9           #ratio:F
    :cond_2
    :goto_1
    sget-object v11, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    move/from16 v0, p2

    invoke-static {p1, v0, v11}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .local v1, bitmap:Landroid/graphics/Bitmap;
    sget-object v11, Lnubia/content/res/IconCustomizer;->sCanvas:Landroid/graphics/Canvas;

    invoke-virtual {v11, v1}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    sub-int v11, p1, v3

    div-int/lit8 v4, v11, 0x2

    .local v4, left:I
    sub-int v11, p2, v2

    div-int/lit8 v10, v11, 0x2

    .local v10, top:I
    sget-object v11, Lnubia/content/res/IconCustomizer;->sOldBounds:Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v13

    invoke-virtual {v11, v13}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    add-int v11, v4, v3

    add-int v13, v10, v2

    invoke-virtual {p0, v4, v10, v11, v13}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    sget-object v11, Lnubia/content/res/IconCustomizer;->sCanvas:Landroid/graphics/Canvas;

    invoke-virtual {p0, v11}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    sget-object v11, Lnubia/content/res/IconCustomizer;->sOldBounds:Landroid/graphics/Rect;

    invoke-virtual {p0, v11}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    monitor-exit v12

    return-object v1

    .end local v1           #bitmap:Landroid/graphics/Bitmap;
    .end local v4           #left:I
    .end local v6           #originalHeight:I
    .end local v7           #originalWidth:I
    .end local v10           #top:I
    :cond_3
    instance-of v11, p0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v11, :cond_0

    move-object v0, p0

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    move-object v5, v0

    .local v5, localBitmapDrawable:Landroid/graphics/drawable/BitmapDrawable;
    invoke-virtual {v5}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v11

    invoke-virtual {v11}, Landroid/graphics/Bitmap;->getDensity()I

    move-result v11

    if-nez v11, :cond_0

    sget-object v11, Lnubia/content/res/IconCustomizer;->sSystemResource:Landroid/content/res/Resources;

    invoke-virtual {v11}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v11

    invoke-virtual {v5, v11}, Landroid/graphics/drawable/BitmapDrawable;->setTargetDensity(Landroid/util/DisplayMetrics;)V

    goto :goto_0

    .end local v5           #localBitmapDrawable:Landroid/graphics/drawable/BitmapDrawable;
    :catchall_0
    move-exception v11

    monitor-exit v12
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v11

    .restart local v6       #originalHeight:I
    .restart local v7       #originalWidth:I
    .restart local v9       #ratio:F
    :cond_4
    int-to-float v11, v2

    mul-float/2addr v11, v9

    float-to-int v3, v11

    goto :goto_1
.end method

.method public static generateIconDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/BitmapDrawable;
    .locals 5
    .parameter "drawable"

    .prologue
    const/4 v4, 0x0

    const-string v3, "icon_edge.png"

    invoke-static {v3, v4, v4}, Lnubia/content/res/IconCustomizer;->getCachedThemeIcon(Ljava/lang/String;II)Landroid/graphics/Bitmap;

    move-result-object v0

    .local v0, edge:Landroid/graphics/Bitmap;
    if-eqz v0, :cond_0

    sget v3, Lnubia/content/res/IconCustomizer;->sDensity:I

    invoke-virtual {v0, v3}, Landroid/graphics/Bitmap;->getScaledWidth(I)I

    move-result v2

    .local v2, edgeWidth:I
    sget v3, Lnubia/content/res/IconCustomizer;->sDensity:I

    invoke-virtual {v0, v3}, Landroid/graphics/Bitmap;->getScaledHeight(I)I

    move-result v1

    .local v1, edgeHeight:I
    :goto_0
    invoke-static {p0, v2, v1}, Lnubia/content/res/IconCustomizer;->drawableToBitmap(Landroid/graphics/drawable/Drawable;II)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-static {v3}, Lnubia/content/res/IconCustomizer;->composeIcon(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-static {v3}, Lnubia/content/res/IconCustomizer;->scaleDrawable(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v3

    return-object v3

    .end local v1           #edgeHeight:I
    .end local v2           #edgeWidth:I
    :cond_0
    sget v2, Lnubia/content/res/IconCustomizer;->sIconWidth:I

    .restart local v2       #edgeWidth:I
    sget v1, Lnubia/content/res/IconCustomizer;->sIconHeight:I

    .restart local v1       #edgeHeight:I
    goto :goto_0
.end method

.method public static getCachedThemeIcon(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 2
    .parameter "packageName"

    .prologue
    sget v0, Lnubia/content/res/IconCustomizer;->sIconWidth:I

    sget v1, Lnubia/content/res/IconCustomizer;->sIconHeight:I

    invoke-static {p0, v0, v1}, Lnubia/content/res/IconCustomizer;->getCachedThemeIcon(Ljava/lang/String;II)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public static getCachedThemeIcon(Ljava/lang/String;II)Landroid/graphics/Bitmap;
    .locals 4
    .parameter "packageName"
    .parameter "width"
    .parameter "height"

    .prologue
    const/4 v0, 0x0

    .local v0, bitmap:Landroid/graphics/Bitmap;
    sget-object v2, Lnubia/content/res/IconCustomizer;->sCache:Ljava/util/HashMap;

    invoke-virtual {v2, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/SoftReference;

    .local v1, softReference:Ljava/lang/ref/SoftReference;,"Ljava/lang/ref/SoftReference<Landroid/graphics/Bitmap;>;"
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    .end local v0           #bitmap:Landroid/graphics/Bitmap;
    check-cast v0, Landroid/graphics/Bitmap;

    .restart local v0       #bitmap:Landroid/graphics/Bitmap;
    :cond_0
    if-nez v0, :cond_1

    invoke-static {p0}, Lnubia/content/res/IconCustomizer;->getThemeIcon(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    sget-object v2, Lnubia/content/res/IconCustomizer;->sCache:Ljava/util/HashMap;

    new-instance v3, Ljava/lang/ref/SoftReference;

    invoke-direct {v3, v0}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v2, p0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    invoke-static {v0, p1, p2}, Lnubia/content/res/IconCustomizer;->scaleBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v2

    return-object v2
.end method

.method public static getCustomizedIconDrawable(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/drawable/BitmapDrawable;
    .locals 8
    .parameter "packageName"
    .parameter "packageItemName"

    .prologue
    invoke-static {p0, p1}, Lnubia/content/res/IconCustomizer;->getFileName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, fileName:Ljava/lang/String;
    invoke-static {v1}, Lnubia/content/res/IconCustomizer;->getThemeIcon(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    .local v2, icon:Landroid/graphics/Bitmap;
    if-nez v2, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_0

    const/4 v6, 0x1

    new-array v5, v6, [Ljava/lang/Object;

    .local v5, objects:[Ljava/lang/Object;
    const/4 v6, 0x0

    aput-object p1, v5, v6

    const-string v6, "%s.png"

    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lnubia/content/res/IconCustomizer;->getThemeIcon(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    .end local v5           #objects:[Ljava/lang/Object;
    :cond_0
    if-nez v2, :cond_1

    sget-object v6, Lnubia/content/res/IconCustomizer;->sIconMapping:Ljava/util/Map;

    invoke-interface {v6, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .local v4, mapValue:Ljava/lang/String;
    if-eqz v4, :cond_1

    invoke-static {v4}, Lnubia/content/res/IconCustomizer;->getThemeIcon(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    .end local v4           #mapValue:Ljava/lang/String;
    :cond_1
    if-nez v2, :cond_2

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "/data/system/theme/customized_icons/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .local v3, iconPath:Ljava/lang/String;
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v0, file:Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-static {v3}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .end local v0           #file:Ljava/io/File;
    .end local v3           #iconPath:Ljava/lang/String;
    :cond_2
    invoke-static {v2}, Lnubia/content/res/IconCustomizer;->scaleDrawable(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object v6

    return-object v6
.end method

.method public static getFileName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .parameter "packageName"
    .parameter "packageItemName"

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    if-nez p1, :cond_0

    new-array v0, v3, [Ljava/lang/Object;

    .local v0, objects:[Ljava/lang/Object;
    aput-object p0, v0, v2

    const-string v1, "%s.png"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    return-object v1

    .end local v0           #objects:[Ljava/lang/Object;
    :cond_0
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    new-array v0, v3, [Ljava/lang/Object;

    .restart local v0       #objects:[Ljava/lang/Object;
    aput-object p1, v0, v2

    const-string v1, "%s.png"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .end local v0           #objects:[Ljava/lang/Object;
    :cond_1
    const/4 v1, 0x2

    new-array v0, v1, [Ljava/lang/Object;

    .restart local v0       #objects:[Ljava/lang/Object;
    aput-object p0, v0, v2

    aput-object p1, v0, v3

    const-string v1, "%s#%s.png"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private static getThemeIcon(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 6
    .parameter "fileName"

    .prologue
    const/4 v0, 0x0

    .local v0, bitmap:Landroid/graphics/Bitmap;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_0
    sget-object v2, Lnubia/content/res/IconCustomizer;->sDensities:[I

    array-length v2, v2

    if-ge v1, v2, :cond_1

    invoke-static {}, Lnubia/content/res/ThemeResources;->getSystem()Lnubia/content/res/ThemeResourcesSystem;

    move-result-object v2

    sget-object v3, Lnubia/content/res/IconCustomizer;->sSystemResource:Landroid/content/res/Resources;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Lnubia/content/res/IconCustomizer;->sDensities:[I

    aget v5, v5, v1

    invoke-static {v5}, Lnubia/util/DisplayUtils;->getDrawbleDensityFolder(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lnubia/content/res/ThemeResourcesSystem;->getIcon(Landroid/content/res/Resources;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-nez v0, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    sget-object v2, Lnubia/content/res/IconCustomizer;->sDensities:[I

    aget v2, v2, v1

    invoke-virtual {v0, v2}, Landroid/graphics/Bitmap;->setDensity(I)V

    :cond_1
    if-nez v0, :cond_2

    invoke-static {}, Lnubia/content/res/ThemeResources;->getSystem()Lnubia/content/res/ThemeResourcesSystem;

    move-result-object v2

    sget-object v3, Lnubia/content/res/IconCustomizer;->sSystemResource:Landroid/content/res/Resources;

    invoke-virtual {v2, v3, p0}, Lnubia/content/res/ThemeResourcesSystem;->getIcon(Landroid/content/res/Resources;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_2

    const/16 v2, 0x1e0

    invoke-virtual {v0, v2}, Landroid/graphics/Bitmap;->setDensity(I)V

    :cond_2
    return-object v0
.end method

.method public static isExclude(Ljava/lang/String;)Z
    .locals 3
    .parameter "packageName"

    .prologue
    sget-object v1, Lnubia/content/res/IconCustomizer;->sExcludeAll:Ljava/lang/Boolean;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    invoke-static {}, Lnubia/content/res/ThemeResources;->getSystem()Lnubia/content/res/ThemeResourcesSystem;

    move-result-object v0

    const-string v2, "exclude_list.txt"

    invoke-virtual {v0, v2}, Lnubia/content/res/ThemeResourcesSystem;->hasIcon(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.browser"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.calendar"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.camera"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.contacts"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.deskclock"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.email"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.fileexplorer"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.gallery"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.launcher"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.mms"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.monitor"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.music"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.phone"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.providers.contacts"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.providers.downloads.ui"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.providers.telephony"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.quicksearchbox"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.settings"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.soundrecorder"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.spare_parts"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.stk"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.thememanager"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    const-string v2, "com.android.updater"

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_0
    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludeAll:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lnubia/content/res/IconCustomizer;->sExcludes:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    monitor-exit v1

    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static saveCustomizedIconBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 10
    .parameter "fileName"
    .parameter "bitmap"

    .prologue
    const/4 v9, -0x1

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "/data/system/theme/customized_icons/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .local v5, path:Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .local v1, file:Ljava/io/File;
    const/4 v2, 0x0

    .local v2, fos:Ljava/io/FileOutputStream;
    :try_start_0
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v2           #fos:Ljava/io/FileOutputStream;
    .local v3, fos:Ljava/io/FileOutputStream;
    const/16 v6, 0x1b4

    const/4 v7, -0x1

    const/4 v8, -0x1

    :try_start_1
    invoke-static {v5, v6, v7, v8}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_4

    :goto_0
    if-nez v3, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v4

    .local v4, parent:Ljava/io/File;
    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0x1ed

    invoke-static {v6, v7, v9, v9}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I

    :try_start_2
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catch Ljava/io/FileNotFoundException; {:try_start_2 .. :try_end_2} :catch_1

    .end local v3           #fos:Ljava/io/FileOutputStream;
    .restart local v2       #fos:Ljava/io/FileOutputStream;
    const/16 v6, 0x1b4

    const/4 v7, -0x1

    const/4 v8, -0x1

    :try_start_3
    invoke-static {v5, v6, v7, v8}, Landroid/os/FileUtils;->setPermissions(Ljava/lang/String;III)I
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_3

    .end local v4           #parent:Ljava/io/File;
    :goto_1
    sget-object v6, Landroid/graphics/Bitmap$CompressFormat;->PNG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v7, 0x64

    invoke-virtual {p1, v6, v7, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    :try_start_4
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    :goto_2
    return-void

    :catch_0
    move-exception v6

    :goto_3
    move-object v3, v2

    .end local v2           #fos:Ljava/io/FileOutputStream;
    .restart local v3       #fos:Ljava/io/FileOutputStream;
    goto :goto_0

    .restart local v4       #parent:Ljava/io/File;
    :catch_1
    move-exception v0

    move-object v2, v3

    .end local v3           #fos:Ljava/io/FileOutputStream;
    .local v0, e:Ljava/io/FileNotFoundException;
    .restart local v2       #fos:Ljava/io/FileOutputStream;
    :goto_4
    goto :goto_2

    .end local v0           #e:Ljava/io/FileNotFoundException;
    .end local v4           #parent:Ljava/io/File;
    :catch_2
    move-exception v6

    goto :goto_2

    .restart local v4       #parent:Ljava/io/File;
    :catch_3
    move-exception v0

    goto :goto_4

    .end local v2           #fos:Ljava/io/FileOutputStream;
    .end local v4           #parent:Ljava/io/File;
    .restart local v3       #fos:Ljava/io/FileOutputStream;
    :catch_4
    move-exception v6

    move-object v2, v3

    .end local v3           #fos:Ljava/io/FileOutputStream;
    .restart local v2       #fos:Ljava/io/FileOutputStream;
    goto :goto_3

    .end local v2           #fos:Ljava/io/FileOutputStream;
    .restart local v3       #fos:Ljava/io/FileOutputStream;
    :cond_0
    move-object v2, v3

    .end local v3           #fos:Ljava/io/FileOutputStream;
    .restart local v2       #fos:Ljava/io/FileOutputStream;
    goto :goto_1
.end method

.method private static scaleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 2
    .parameter "bitmap"

    .prologue
    sget v0, Lnubia/content/res/IconCustomizer;->sIconWidth:I

    sget v1, Lnubia/content/res/IconCustomizer;->sIconHeight:I

    invoke-static {p0, v0, v1}, Lnubia/content/res/IconCustomizer;->scaleBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method private static scaleBitmap(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 1
    .parameter "bitmap"
    .parameter "customizedIconWidth"
    .parameter "customizedIconHeight"

    .prologue
    if-eqz p0, :cond_2

    if-lez p1, :cond_1

    if-lez p2, :cond_1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    if-ne v0, p1, :cond_0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    if-eq v0, p2, :cond_1

    :cond_0
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p0

    sget v0, Lnubia/content/res/IconCustomizer;->sDensity:I

    invoke-virtual {p0, v0}, Landroid/graphics/Bitmap;->setDensity(I)V

    .end local p0
    :cond_1
    :goto_0
    return-object p0

    .restart local p0
    :cond_2
    const/4 p0, 0x0

    goto :goto_0
.end method

.method private static scaleDrawable(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/BitmapDrawable;
    .locals 3
    .parameter "bitmap"

    .prologue
    if-eqz p0, :cond_0

    new-instance v0, Landroid/graphics/drawable/BitmapDrawable;

    sget-object v1, Lnubia/content/res/IconCustomizer;->sSystemResource:Landroid/content/res/Resources;

    invoke-static {p0}, Lnubia/content/res/IconCustomizer;->scaleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static scalePixel(I)I
    .locals 3
    .parameter "pixel"

    .prologue
    sget v0, Lnubia/content/res/IconCustomizer;->sDensity:I

    .local v0, density:I
    sget v1, Lnubia/content/res/IconCustomizer;->sDensity:I

    const/16 v2, 0x140

    if-ne v1, v2, :cond_1

    sget v1, Lnubia/content/res/IconCustomizer;->sDensity:I

    mul-int/lit8 v1, v1, 0x78

    div-int/lit8 v0, v1, 0x60

    :cond_0
    :goto_0
    mul-int v1, p0, v0

    div-int/lit16 v1, v1, 0xf0

    return v1

    :cond_1
    sget v1, Lnubia/content/res/IconCustomizer;->sDensity:I

    const/16 v2, 0x1e0

    if-ne v1, v2, :cond_0

    sget v1, Lnubia/content/res/IconCustomizer;->sDensity:I

    mul-int/lit16 v1, v1, 0xb4

    div-int/lit16 v0, v1, 0x90

    goto :goto_0
.end method
