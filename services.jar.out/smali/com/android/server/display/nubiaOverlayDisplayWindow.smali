.class final Lcom/android/server/display/nubiaOverlayDisplayWindow;
.super Ljava/lang/Object;
.source "nubiaOverlayDisplayWindow.java"

# interfaces
.implements Lcom/android/internal/util/DumpUtils$Dump;
.implements Lcom/android/server/display/OnDoubleTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/display/nubiaOverlayDisplayWindow$MutiWindowContentObserver;,
        Lcom/android/server/display/nubiaOverlayDisplayWindow$Listener;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final FIELD_MULTI_WINDOW:Ljava/lang/String; = "ss_multi_window_enabled"

.field static final FIELD_SINGLE_UI_MODE:Ljava/lang/String; = "single_ui_mode"

.field private static final FIELD_SINGLE_UI_MODE_SENSOR_SWITCH:Ljava/lang/String; = "single_ui_mode_sensor_switch"

.field private static KEY_MENU_AND_HOME_POS:Ljava/lang/String; = null

.field private static final NUBIA_OVERLAY_DISPLAY_DEVICES:Ljava/lang/String; = "nubia_overlay_display_devices"

.field private static final NUBIA_OVERLAY_DISPLAY_DEVICES_MERMORY:Ljava/lang/String; = "nubia_overlay_display_devices_mermory"

.field private static final TAG:Ljava/lang/String; = "NubiaOverlayDisplayWindow"

.field private static mWindowVisible:Z


# instance fields
.field private final BH:I

.field private final BW:I

.field private final DISABLE_MOVE_AND_RESIZE:Z

.field private final EW:I

.field private final GROUND_WINDOW_ALPHA:F

.field private final GROUND_WINDOW_ALPHA_SECOND:F

.field private KH:I

.field private MH:I

.field private final TW:I

.field private final WINDOW_ALPHA:F

.field private X:I

.field private Y:I

.field private down:I

.field private downTime:J

.field private isMoveing:Ljava/lang/Boolean;

.field private isRight:Ljava/lang/Boolean;

.field private mBackView:Landroid/widget/ImageView;

.field private final mContext:Landroid/content/Context;

.field private mCustomView:Landroid/widget/ImageView;

.field private final mDefaultDisplay:Landroid/view/Display;

.field private final mDefaultDisplayInfo:Landroid/view/DisplayInfo;

.field private final mDensityDpi:I

.field private final mDisplayListener:Landroid/hardware/display/DisplayManager$DisplayListener;

.field private final mDisplayManager:Landroid/hardware/display/DisplayManager;

.field private final mDisplayMatrix:Landroid/graphics/Matrix;

.field private final mDisplayMetrics:Landroid/util/DisplayMetrics;

.field private mDownPoint:Landroid/graphics/Point;

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private final mGravity:I

.field private final mHeight:I

.field private mHomeView:Landroid/widget/ImageView;

.field private mIsLock:Z

.field private final mListener:Lcom/android/server/display/nubiaOverlayDisplayWindow$Listener;

.field private mLiveTranslationX:F

.field private mLiveTranslationY:F

.field private mLockView:Landroid/widget/ImageView;

.field private mLogicalHeight:I

.field private mLogicalWidth:I

.field private mMainScreenView:Landroid/view/View;

.field private mMenuView:Landroid/widget/ImageView;

.field private mMoveStatusView:Landroid/widget/ImageView;

.field private mMoveView:Landroid/view/ViewGroup;

.field private mMoveViewTag1:Landroid/widget/ImageView;

.field private mMoveViewTag2:Landroid/widget/ImageView;

.field private mMutiWindowContentObserver:Lcom/android/server/display/nubiaOverlayDisplayWindow$MutiWindowContentObserver;

.field private final mName:Ljava/lang/String;

.field private mOnBackKeyTouchListener:Landroid/view/View$OnTouchListener;

.field private final mOnGestureListener:Landroid/view/GestureDetector$OnGestureListener;

.field private mOnHomeKeyTouchListener:Landroid/view/View$OnTouchListener;

.field private mOnMenuKeyTouchListener:Landroid/view/View$OnTouchListener;

.field private mOnMoveTouchListener:Landroid/view/View$OnTouchListener;

.field private mRecordH:I

.field private mRecordW:I

.field private mRecordX:I

.field private mRecordY:I

.field private mRotated:I

.field private mScaleX:F

.field private mScaleY:F

.field private mScreenShotView:Landroid/widget/ImageView;

.field private mScreenshotBitmap:Landroid/graphics/Bitmap;

.field private mSingleParams:Landroid/widget/AbsoluteLayout$LayoutParams;

.field private mStartX:F

.field private mStartY:F

.field private final mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

.field private mTextureView:Landroid/view/TextureView;

.field private final mWidth:I

.field private mWindowContent:Landroid/widget/RelativeLayout;

.field private mWindowContentBg:Landroid/view/View;

.field private mWindowContentGround:Landroid/view/View;

.field private mWindowContentGround2:Landroid/view/View;

.field private mWindowContentMoveBottom:Landroid/view/View;

.field private mWindowContentMoveLeft:Landroid/view/View;

.field private mWindowContentMoveRight:Landroid/view/View;

.field private mWindowContentMoveTop:Landroid/view/View;

.field private mWindowContentUI:Landroid/view/View;

.field private final mWindowManager:Landroid/view/WindowManager;

.field private mWindowParams:Landroid/view/WindowManager$LayoutParams;

.field private mWindowParams2:Landroid/view/WindowManager$LayoutParams;

.field private mWindowParamsGround:Landroid/view/WindowManager$LayoutParams;

.field private mWindowParamsGround2:Landroid/view/WindowManager$LayoutParams;

.field private mWindowScale:F

.field private mWindowX:I

.field private mWindowY:I

.field private move:I

.field private final rate:D

.field private upTime:J

.field private upnum:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const-string v0, "persist.sys.key.menu2back"

    sput-object v0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->KEY_MENU_AND_HOME_POS:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;IIIILjava/lang/String;DLcom/android/server/display/nubiaOverlayDisplayWindow$Listener;)V
    .locals 4
    .parameter "context"
    .parameter "name"
    .parameter "width"
    .parameter "height"
    .parameter "densityDpi"
    .parameter "gravity"
    .parameter "leftOrRight"
    .parameter "rate"
    .parameter "listener"

    .prologue
    const/16 v1, 0x64

    const/4 v3, 0x1

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x3f7d70a4

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->WINDOW_ALPHA:F

    const v0, 0x3ecccccd

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->GROUND_WINDOW_ALPHA:F

    const v0, 0x3f59999a

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->GROUND_WINDOW_ALPHA_SECOND:F

    iput v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->BW:I

    iput v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->BH:I

    const/4 v0, 0x5

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->EW:I

    const/16 v0, 0x32

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->TW:I

    const/16 v0, 0x3c

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->MH:I

    const/16 v0, 0x6e

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->KH:I

    iput-boolean v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->DISABLE_MOVE_AND_RESIZE:Z

    new-instance v0, Landroid/view/DisplayInfo;

    invoke-direct {v0}, Landroid/view/DisplayInfo;-><init>()V

    iput-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDefaultDisplayInfo:Landroid/view/DisplayInfo;

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->isRight:Ljava/lang/Boolean;

    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDownPoint:Landroid/graphics/Point;

    const/4 v0, -0x1

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mRotated:I

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->isMoveing:Ljava/lang/Boolean;

    iput v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->down:I

    iput v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->move:I

    iput v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->upnum:I

    new-instance v0, Lcom/android/server/display/nubiaOverlayDisplayWindow$1;

    invoke-direct {v0, p0}, Lcom/android/server/display/nubiaOverlayDisplayWindow$1;-><init>(Lcom/android/server/display/nubiaOverlayDisplayWindow;)V

    iput-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mOnMoveTouchListener:Landroid/view/View$OnTouchListener;

    new-instance v0, Lcom/android/server/display/nubiaOverlayDisplayWindow$2;

    invoke-direct {v0, p0}, Lcom/android/server/display/nubiaOverlayDisplayWindow$2;-><init>(Lcom/android/server/display/nubiaOverlayDisplayWindow;)V

    iput-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mOnMenuKeyTouchListener:Landroid/view/View$OnTouchListener;

    new-instance v0, Lcom/android/server/display/nubiaOverlayDisplayWindow$3;

    invoke-direct {v0, p0}, Lcom/android/server/display/nubiaOverlayDisplayWindow$3;-><init>(Lcom/android/server/display/nubiaOverlayDisplayWindow;)V

    iput-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mOnHomeKeyTouchListener:Landroid/view/View$OnTouchListener;

    new-instance v0, Lcom/android/server/display/nubiaOverlayDisplayWindow$4;

    invoke-direct {v0, p0}, Lcom/android/server/display/nubiaOverlayDisplayWindow$4;-><init>(Lcom/android/server/display/nubiaOverlayDisplayWindow;)V

    iput-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mOnBackKeyTouchListener:Landroid/view/View$OnTouchListener;

    new-instance v0, Lcom/android/server/display/nubiaOverlayDisplayWindow$5;

    invoke-direct {v0, p0}, Lcom/android/server/display/nubiaOverlayDisplayWindow$5;-><init>(Lcom/android/server/display/nubiaOverlayDisplayWindow;)V

    iput-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDisplayListener:Landroid/hardware/display/DisplayManager$DisplayListener;

    new-instance v0, Lcom/android/server/display/nubiaOverlayDisplayWindow$6;

    invoke-direct {v0, p0}, Lcom/android/server/display/nubiaOverlayDisplayWindow$6;-><init>(Lcom/android/server/display/nubiaOverlayDisplayWindow;)V

    iput-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    new-instance v0, Lcom/android/server/display/nubiaOverlayDisplayWindow$7;

    invoke-direct {v0, p0}, Lcom/android/server/display/nubiaOverlayDisplayWindow$7;-><init>(Lcom/android/server/display/nubiaOverlayDisplayWindow;)V

    iput-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mOnGestureListener:Landroid/view/GestureDetector$OnGestureListener;

    iput-object p1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mName:Ljava/lang/String;

    iput-wide p8, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->rate:D

    int-to-double v0, p3

    div-double/2addr v0, p8

    double-to-int v0, v0

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    int-to-double v0, p4

    div-double/2addr v0, p8

    double-to-int v0, v0

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    iput p5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDensityDpi:I

    iput p6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mGravity:I

    iput-object p10, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mListener:Lcom/android/server/display/nubiaOverlayDisplayWindow$Listener;

    const-string v0, "display"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/display/DisplayManager;

    iput-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    const-string v0, "window"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iput-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowManager:Landroid/view/WindowManager;

    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowManager:Landroid/view/WindowManager;

    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDefaultDisplay:Landroid/view/Display;

    invoke-direct {p0}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->updateDefaultDisplayInfo()Z

    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDefaultDisplay:Landroid/view/Display;

    invoke-virtual {v0}, Landroid/view/Display;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalWidth:I

    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDefaultDisplay:Landroid/view/Display;

    invoke-virtual {v0}, Landroid/view/Display;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalHeight:I

    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    iput-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDisplayMetrics:Landroid/util/DisplayMetrics;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDisplayMatrix:Landroid/graphics/Matrix;

    const-string v0, "left"

    invoke-virtual {p7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->isRight:Ljava/lang/Boolean;

    :goto_0
    iget v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalWidth:I

    iget v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalHeight:I

    if-ge v0, v1, :cond_1

    iget v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalWidth:I

    int-to-float v0, v0

    iget v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mScaleX:F

    iget v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalHeight:I

    add-int/lit8 v0, v0, -0x1

    int-to-float v0, v0

    iget v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mScaleY:F

    :goto_1
    invoke-direct {p0}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->createWindow()V

    return-void

    :cond_0
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->isRight:Ljava/lang/Boolean;

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalWidth:I

    int-to-float v0, v0

    iget v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mScaleX:F

    iget v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalHeight:I

    add-int/lit8 v0, v0, -0x1

    int-to-float v0, v0

    iget v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mScaleY:F

    goto :goto_1
.end method

.method static synthetic access$002(Lcom/android/server/display/nubiaOverlayDisplayWindow;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput p1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->X:I

    return p1
.end method

.method static synthetic access$1000(Lcom/android/server/display/nubiaOverlayDisplayWindow;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->clickSwitchLock()V

    return-void
.end method

.method static synthetic access$102(Lcom/android/server/display/nubiaOverlayDisplayWindow;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput p1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->Y:I

    return p1
.end method

.method static synthetic access$1100()Ljava/lang/String;
    .locals 1

    .prologue
    sget-object v0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->KEY_MENU_AND_HOME_POS:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/android/server/display/nubiaOverlayDisplayWindow;)Landroid/view/Display;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDefaultDisplay:Landroid/view/Display;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/android/server/display/nubiaOverlayDisplayWindow;)Z
    .locals 1
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->updateDefaultDisplayInfo()Z

    move-result v0

    return v0
.end method

.method static synthetic access$1400(Lcom/android/server/display/nubiaOverlayDisplayWindow;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->relayout()V

    return-void
.end method

.method static synthetic access$1500(Lcom/android/server/display/nubiaOverlayDisplayWindow;)Landroid/view/DisplayInfo;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDefaultDisplayInfo:Landroid/view/DisplayInfo;

    return-object v0
.end method

.method static synthetic access$1600(Lcom/android/server/display/nubiaOverlayDisplayWindow;)Lcom/android/server/display/nubiaOverlayDisplayWindow$Listener;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mListener:Lcom/android/server/display/nubiaOverlayDisplayWindow$Listener;

    return-object v0
.end method

.method static synthetic access$1700(Lcom/android/server/display/nubiaOverlayDisplayWindow;)I
    .locals 1
    .parameter "x0"

    .prologue
    iget v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mRotated:I

    return v0
.end method

.method static synthetic access$1824(Lcom/android/server/display/nubiaOverlayDisplayWindow;F)F
    .locals 1
    .parameter "x0"
    .parameter "x1"

    .prologue
    iget v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLiveTranslationX:F

    sub-float/2addr v0, p1

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLiveTranslationX:F

    return v0
.end method

.method static synthetic access$1900(Lcom/android/server/display/nubiaOverlayDisplayWindow;)Landroid/content/Context;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200(Lcom/android/server/display/nubiaOverlayDisplayWindow;)I
    .locals 1
    .parameter "x0"

    .prologue
    iget v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->down:I

    return v0
.end method

.method static synthetic access$202(Lcom/android/server/display/nubiaOverlayDisplayWindow;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput p1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->down:I

    return p1
.end method

.method static synthetic access$208(Lcom/android/server/display/nubiaOverlayDisplayWindow;)I
    .locals 2
    .parameter "x0"

    .prologue
    iget v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->down:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->down:I

    return v0
.end method

.method static synthetic access$2100(Lcom/android/server/display/nubiaOverlayDisplayWindow;)Landroid/widget/AbsoluteLayout$LayoutParams;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mSingleParams:Landroid/widget/AbsoluteLayout$LayoutParams;

    return-object v0
.end method

.method static synthetic access$302(Lcom/android/server/display/nubiaOverlayDisplayWindow;F)F
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput p1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mStartX:F

    return p1
.end method

.method static synthetic access$402(Lcom/android/server/display/nubiaOverlayDisplayWindow;F)F
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput p1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mStartY:F

    return p1
.end method

.method static synthetic access$500(Lcom/android/server/display/nubiaOverlayDisplayWindow;)I
    .locals 1
    .parameter "x0"

    .prologue
    iget v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->move:I

    return v0
.end method

.method static synthetic access$502(Lcom/android/server/display/nubiaOverlayDisplayWindow;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput p1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->move:I

    return p1
.end method

.method static synthetic access$508(Lcom/android/server/display/nubiaOverlayDisplayWindow;)I
    .locals 2
    .parameter "x0"

    .prologue
    iget v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->move:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->move:I

    return v0
.end method

.method static synthetic access$600(Lcom/android/server/display/nubiaOverlayDisplayWindow;I)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    invoke-direct {p0, p1}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->updateWindowPosition(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/android/server/display/nubiaOverlayDisplayWindow;)Z
    .locals 1
    .parameter "x0"

    .prologue
    iget-boolean v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mIsLock:Z

    return v0
.end method

.method static synthetic access$800(Lcom/android/server/display/nubiaOverlayDisplayWindow;)Landroid/widget/ImageView;
    .locals 1
    .parameter "x0"

    .prologue
    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mMoveStatusView:Landroid/widget/ImageView;

    return-object v0
.end method

.method static synthetic access$900(Lcom/android/server/display/nubiaOverlayDisplayWindow;)I
    .locals 1
    .parameter "x0"

    .prologue
    iget v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->upnum:I

    return v0
.end method

.method static synthetic access$902(Lcom/android/server/display/nubiaOverlayDisplayWindow;I)I
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    iput p1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->upnum:I

    return p1
.end method

.method static synthetic access$908(Lcom/android/server/display/nubiaOverlayDisplayWindow;)I
    .locals 2
    .parameter "x0"

    .prologue
    iget v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->upnum:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->upnum:I

    return v0
.end method

.method private clickSwitchLock()V
    .locals 0

    .prologue
    invoke-virtual {p0}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->onDoubleTouch()V

    return-void
.end method

.method private createShowAnimation()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    sput-boolean v0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowVisible:Z

    return-void
.end method

.method private createWindow()V
    .locals 9

    .prologue
    const v5, 0x10805d7

    const/16 v8, 0x7ea

    const/4 v4, 0x0

    const/4 v7, 0x1

    const/4 v2, 0x0

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .local v0, inflater:Landroid/view/LayoutInflater;
    const v1, 0x10900b0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/RelativeLayout;

    iput-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContent:Landroid/widget/RelativeLayout;

    const v1, 0x10900b1

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContentBg:Landroid/view/View;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContentBg:Landroid/view/View;

    invoke-direct {p0, v1, p0}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->registerDoubleTouchListener(Landroid/view/View;Lcom/android/server/display/OnDoubleTouchListener;)V

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContent:Landroid/widget/RelativeLayout;

    const v3, 0x102034d

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mMainScreenView:Landroid/view/View;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mMainScreenView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContent:Landroid/widget/RelativeLayout;

    const v3, 0x102034c

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLockView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContent:Landroid/widget/RelativeLayout;

    const v3, 0x102034f

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iput-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mMoveView:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mMoveView:Landroid/view/ViewGroup;

    iget-object v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mOnMoveTouchListener:Landroid/view/View$OnTouchListener;

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContent:Landroid/widget/RelativeLayout;

    const v3, 0x1020350

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mMoveViewTag1:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mMoveViewTag1:Landroid/widget/ImageView;

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContent:Landroid/widget/RelativeLayout;

    const v3, 0x1020352

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mMoveViewTag2:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mMoveViewTag2:Landroid/widget/ImageView;

    invoke-virtual {v1, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mMoveView:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->MH:I

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContent:Landroid/widget/RelativeLayout;

    const v3, 0x1020354

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->KH:I

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContent:Landroid/widget/RelativeLayout;

    const v3, 0x1020351

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mMoveStatusView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContent:Landroid/widget/RelativeLayout;

    const v3, 0x1020355

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mMenuView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mMenuView:Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mOnMenuKeyTouchListener:Landroid/view/View$OnTouchListener;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContent:Landroid/widget/RelativeLayout;

    const v3, 0x1020356

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHomeView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHomeView:Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mOnHomeKeyTouchListener:Landroid/view/View$OnTouchListener;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContent:Landroid/widget/RelativeLayout;

    const v3, 0x1020357

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mBackView:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mBackView:Landroid/widget/ImageView;

    iget-object v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mOnBackKeyTouchListener:Landroid/view/View$OnTouchListener;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContent:Landroid/widget/RelativeLayout;

    const v3, 0x102034e

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContentUI:Landroid/view/View;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContent:Landroid/widget/RelativeLayout;

    const v3, 0x1020353

    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/TextureView;

    iput-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mTextureView:Landroid/view/TextureView;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v1, v4}, Landroid/view/TextureView;->setPivotX(F)V

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v1, v4}, Landroid/view/TextureView;->setPivotY(F)V

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v1}, Landroid/view/TextureView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    int-to-double v3, v3

    iget-wide v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->rate:D

    mul-double/2addr v3, v5

    double-to-int v3, v3

    iput v3, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v1}, Landroid/view/TextureView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    int-to-double v3, v3

    iget-wide v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->rate:D

    mul-double/2addr v3, v5

    double-to-int v3, v3

    iput v3, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v1, v7}, Landroid/view/TextureView;->setOpaque(Z)V

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mTextureView:Landroid/view/TextureView;

    iget-object v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mSurfaceTextureListener:Landroid/view/TextureView$SurfaceTextureListener;

    invoke-virtual {v1, v3}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    new-instance v1, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v1, v8}, Landroid/view/WindowManager$LayoutParams;-><init>(I)V

    iput-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->x:I

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iput v7, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    iget v4, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->MH:I

    add-int/2addr v3, v4

    iget v4, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->KH:I

    add-int/2addr v3, v4

    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    invoke-direct {p0, v1}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->setLayoutParams(Landroid/view/WindowManager$LayoutParams;)V

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    const v3, 0x3f7d70a4

    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->alpha:F

    new-instance v1, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v1, v8}, Landroid/view/WindowManager$LayoutParams;-><init>(I)V

    iput-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams2:Landroid/view/WindowManager$LayoutParams;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams2:Landroid/view/WindowManager$LayoutParams;

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->x:I

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams2:Landroid/view/WindowManager$LayoutParams;

    iput v7, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams2:Landroid/view/WindowManager$LayoutParams;

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalWidth:I

    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->width:I

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams2:Landroid/view/WindowManager$LayoutParams;

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalHeight:I

    add-int/lit8 v3, v3, -0x1

    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams2:Landroid/view/WindowManager$LayoutParams;

    invoke-direct {p0, v1}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->setLayoutParams(Landroid/view/WindowManager$LayoutParams;)V

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams2:Landroid/view/WindowManager$LayoutParams;

    const/high16 v3, 0x3f40

    iput v3, v1, Landroid/view/WindowManager$LayoutParams;->alpha:F

    new-instance v1, Landroid/view/GestureDetector;

    iget-object v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mOnGestureListener:Landroid/view/GestureDetector$OnGestureListener;

    invoke-direct {v1, v3, v4}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mGestureDetector:Landroid/view/GestureDetector;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->isRight:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDefaultDisplayInfo:Landroid/view/DisplayInfo;

    iget v1, v1, Landroid/view/DisplayInfo;->logicalWidth:I

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    add-int/lit8 v3, v3, 0x64

    add-int/lit8 v3, v3, 0xa

    sub-int/2addr v1, v3

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    iput v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowX:I

    :goto_0
    iget v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mGravity:I

    and-int/lit8 v1, v1, 0x30

    const/16 v3, 0x30

    if-ne v1, v3, :cond_1

    move v1, v2

    :goto_1
    iput v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowY:I

    new-instance v1, Lcom/android/server/display/nubiaOverlayDisplayWindow$MutiWindowContentObserver;

    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    invoke-direct {v1, p0, v2}, Lcom/android/server/display/nubiaOverlayDisplayWindow$MutiWindowContentObserver;-><init>(Lcom/android/server/display/nubiaOverlayDisplayWindow;Landroid/os/Handler;)V

    iput-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mMutiWindowContentObserver:Lcom/android/server/display/nubiaOverlayDisplayWindow$MutiWindowContentObserver;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mMutiWindowContentObserver:Lcom/android/server/display/nubiaOverlayDisplayWindow$MutiWindowContentObserver;

    invoke-virtual {v1}, Lcom/android/server/display/nubiaOverlayDisplayWindow$MutiWindowContentObserver;->observe()V

    return-void

    :cond_0
    iput v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowX:I

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDefaultDisplayInfo:Landroid/view/DisplayInfo;

    iget v1, v1, Landroid/view/DisplayInfo;->logicalHeight:I

    goto :goto_1
.end method

.method private registerDoubleTouchListener(Landroid/view/View;Lcom/android/server/display/OnDoubleTouchListener;)V
    .locals 1
    .parameter "view"
    .parameter "listener"

    .prologue
    new-instance v0, Lcom/android/server/display/nubiaOverlayDisplayWindow$8;

    invoke-direct {v0, p0, p2}, Lcom/android/server/display/nubiaOverlayDisplayWindow$8;-><init>(Lcom/android/server/display/nubiaOverlayDisplayWindow;Lcom/android/server/display/OnDoubleTouchListener;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method private relayout()V
    .locals 3

    .prologue
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->isMoveing:Ljava/lang/Boolean;

    sget-boolean v0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowVisible:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->updateWindowParams()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowManager:Landroid/view/WindowManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowManager:Landroid/view/WindowManager;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContent:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v0, v1, v2}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_0
    return-void
.end method

.method private saveWindowParams()V
    .locals 2

    .prologue
    iget v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mRotated:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mRotated:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowX:I

    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowY:I

    :goto_0
    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v0}, Landroid/view/TextureView;->getScaleX()F

    move-result v0

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowScale:F

    return-void

    :cond_1
    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowY:I

    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    iput v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowX:I

    goto :goto_0
.end method

.method private setInputRect(IIII)V
    .locals 7
    .parameter "x"
    .parameter "y"
    .parameter "w"
    .parameter "h"

    .prologue
    const/4 v5, 0x0

    new-instance v2, Landroid/graphics/Rect;

    iget-object v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDefaultDisplayInfo:Landroid/view/DisplayInfo;

    iget v3, v3, Landroid/view/DisplayInfo;->logicalWidth:I

    iget-object v4, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDefaultDisplayInfo:Landroid/view/DisplayInfo;

    iget v4, v4, Landroid/view/DisplayInfo;->logicalHeight:I

    invoke-direct {v2, v5, v5, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .local v2, mRect3:Landroid/graphics/Rect;
    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mRotated:I

    packed-switch v3, :pswitch_data_0

    :pswitch_0
    iget-object v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->isRight:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_0

    new-instance v0, Landroid/graphics/Rect;

    add-int v3, p1, p3

    add-int v4, p2, p4

    invoke-direct {v0, p1, p2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .local v0, mRect:Landroid/graphics/Rect;
    new-instance v1, Landroid/graphics/Rect;

    add-int/lit8 v3, p2, -0x32

    add-int v4, p1, p3

    add-int v5, p2, p4

    invoke-direct {v1, p1, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .local v1, mRect2:Landroid/graphics/Rect;
    :goto_0
    invoke-static {v0, v1, v2}, Lcom/android/server/display/SingleUIRectNotifyer;->notifyInputDispatcherSingleUIRect(Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Rect;)V

    return-void

    .end local v0           #mRect:Landroid/graphics/Rect;
    .end local v1           #mRect2:Landroid/graphics/Rect;
    :cond_0
    new-instance v0, Landroid/graphics/Rect;

    add-int v3, p1, p3

    add-int v4, p2, p4

    invoke-direct {v0, p1, p2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .restart local v0       #mRect:Landroid/graphics/Rect;
    new-instance v1, Landroid/graphics/Rect;

    add-int/lit8 v3, p2, -0x32

    add-int v4, p1, p3

    add-int v5, p2, p4

    invoke-direct {v1, p1, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .restart local v1       #mRect2:Landroid/graphics/Rect;
    goto :goto_0

    .end local v0           #mRect:Landroid/graphics/Rect;
    .end local v1           #mRect2:Landroid/graphics/Rect;
    :pswitch_1
    iget-object v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->isRight:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_1

    new-instance v0, Landroid/graphics/Rect;

    add-int v3, p1, p4

    add-int v4, p2, p3

    invoke-direct {v0, p1, p2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .restart local v0       #mRect:Landroid/graphics/Rect;
    new-instance v1, Landroid/graphics/Rect;

    add-int/lit8 v3, p1, -0x32

    add-int/lit16 v4, p2, -0x96

    add-int v5, p1, p4

    add-int/lit8 v5, v5, 0x32

    add-int v6, p2, p3

    add-int/lit8 v6, v6, 0x32

    invoke-direct {v1, v3, v4, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .restart local v1       #mRect2:Landroid/graphics/Rect;
    goto :goto_0

    .end local v0           #mRect:Landroid/graphics/Rect;
    .end local v1           #mRect2:Landroid/graphics/Rect;
    :cond_1
    new-instance v0, Landroid/graphics/Rect;

    add-int/lit8 v3, p2, 0x64

    add-int v4, p1, p4

    add-int/lit8 v5, p2, 0x64

    add-int/2addr v5, p3

    invoke-direct {v0, p1, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .restart local v0       #mRect:Landroid/graphics/Rect;
    new-instance v1, Landroid/graphics/Rect;

    add-int/lit8 v3, p1, -0x32

    add-int/lit8 v4, p2, 0x64

    add-int/lit8 v4, v4, -0x32

    add-int v5, p1, p4

    add-int/lit8 v5, v5, 0x32

    add-int/lit8 v6, p2, 0x64

    add-int/2addr v6, p3

    add-int/lit8 v6, v6, 0x32

    invoke-direct {v1, v3, v4, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .restart local v1       #mRect2:Landroid/graphics/Rect;
    goto :goto_0

    .end local v0           #mRect:Landroid/graphics/Rect;
    .end local v1           #mRect2:Landroid/graphics/Rect;
    :pswitch_2
    iget-object v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->isRight:Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_2

    new-instance v0, Landroid/graphics/Rect;

    add-int/lit8 v3, p2, -0x64

    add-int v4, p1, p4

    add-int/lit8 v5, p2, -0x64

    add-int/2addr v5, p3

    invoke-direct {v0, p1, v3, v4, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    .restart local v0       #mRect:Landroid/graphics/Rect;
    new-instance v1, Landroid/graphics/Rect;

    add-int/lit8 v3, p1, -0x32

    add-int/lit8 v4, p2, -0x64

    add-int/lit16 v4, v4, -0x96

    add-int v5, p1, p4

    add-int/lit8 v5, v5, 0x32

    add-int/lit8 v6, p2, -0x64

    add-int/2addr v6, p3

    add-int/lit8 v6, v6, 0x32

    invoke-direct {v1, v3, v4, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .restart local v1       #mRect2:Landroid/graphics/Rect;
    goto/16 :goto_0

    .end local v0           #mRect:Landroid/graphics/Rect;
    .end local v1           #mRect2:Landroid/graphics/Rect;
    :cond_2
    new-instance v0, Landroid/graphics/Rect;

    add-int v3, p1, p4

    add-int v4, p2, p3

    invoke-direct {v0, p1, p2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .restart local v0       #mRect:Landroid/graphics/Rect;
    new-instance v1, Landroid/graphics/Rect;

    add-int/lit8 v3, p1, -0x32

    add-int/lit16 v4, p2, -0x96

    add-int v5, p1, p4

    add-int/lit8 v5, v5, 0x32

    add-int v6, p2, p3

    add-int/lit8 v6, v6, 0x32

    invoke-direct {v1, v3, v4, v5, v6}, Landroid/graphics/Rect;-><init>(IIII)V

    .restart local v1       #mRect2:Landroid/graphics/Rect;
    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private setLayoutParams(Landroid/view/WindowManager$LayoutParams;)V
    .locals 2
    .parameter "l"

    .prologue
    iget v0, p1, Landroid/view/WindowManager$LayoutParams;->flags:I

    const v1, 0x1000328

    or-int/2addr v0, v1

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->flags:I

    iget v0, p1, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    const/16 v0, 0x33

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    const-string v0, "singleUI_view_layer"

    invoke-virtual {p1, v0}, Landroid/view/WindowManager$LayoutParams;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private setLayoutParamsWH(Landroid/view/ViewGroup$LayoutParams;II)V
    .locals 0
    .parameter "l"
    .parameter "w"
    .parameter "h"

    .prologue
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput p3, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    return-void
.end method

.method private updateDefaultDisplayInfo()Z
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDefaultDisplay:Landroid/view/Display;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDefaultDisplayInfo:Landroid/view/DisplayInfo;

    invoke-virtual {v0, v1}, Landroid/view/Display;->getDisplayInfo(Landroid/view/DisplayInfo;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "NubiaOverlayDisplayWindow"

    const-string v1, "Cannot show overlay display because there is no default display upon which to show it."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private updateWindowParams()Z
    .locals 11

    .prologue
    const/4 v10, 0x1

    const/high16 v9, 0x3f80

    const/4 v8, 0x0

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDefaultDisplay:Landroid/view/Display;

    invoke-virtual {v5}, Landroid/view/Display;->getRotation()I

    move-result v3

    .local v3, rotation:I
    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    .local v2, matrix:Landroid/graphics/Matrix;
    packed-switch v3, :pswitch_data_0

    :pswitch_0
    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "nubia_overlay_display_devices_mermory"

    invoke-static {v5, v6}, Landroid/provider/Settings$Global;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, deviceMemory:Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    const-string v5, ","

    invoke-virtual {v1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .local v0, deviceData:[Ljava/lang/String;
    aget-object v5, v0, v8

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mRecordX:I

    aget-object v5, v0, v10

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mRecordY:I

    const/4 v5, 0x2

    aget-object v5, v0, v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mRecordW:I

    const/4 v5, 0x3

    aget-object v5, v0, v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mRecordH:I

    .end local v0           #deviceData:[Ljava/lang/String;
    :cond_0
    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContentUI:Landroid/view/View;

    invoke-virtual {v5, v8, v8, v8, v8}, Landroid/view/View;->setPadding(IIII)V

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContentUI:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/AbsoluteLayout$LayoutParams;

    iput-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mSingleParams:Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalWidth:I

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    sub-int/2addr v6, v7

    iput v6, v5, Landroid/view/WindowManager$LayoutParams;->x:I

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalHeight:I

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    sub-int/2addr v6, v7

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->MH:I

    sub-int/2addr v6, v7

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->KH:I

    sub-int/2addr v6, v7

    add-int/lit8 v6, v6, -0x1

    iput v6, v5, Landroid/view/WindowManager$LayoutParams;->y:I

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    iput v6, v5, Landroid/view/WindowManager$LayoutParams;->width:I

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->MH:I

    add-int/2addr v6, v7

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->KH:I

    add-int/2addr v6, v7

    iput v6, v5, Landroid/view/WindowManager$LayoutParams;->height:I

    :goto_0
    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mSingleParams:Landroid/widget/AbsoluteLayout$LayoutParams;

    iput v8, v5, Landroid/widget/AbsoluteLayout$LayoutParams;->x:I

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mSingleParams:Landroid/widget/AbsoluteLayout$LayoutParams;

    iput v8, v5, Landroid/widget/AbsoluteLayout$LayoutParams;->y:I

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContentUI:Landroid/view/View;

    iget-object v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mSingleParams:Landroid/widget/AbsoluteLayout$LayoutParams;

    invoke-virtual {v5, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-wide v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->rate:D

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    int-to-double v7, v7

    mul-double/2addr v5, v7

    double-to-float v5, v5

    iget v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    int-to-float v6, v6

    sub-float/2addr v5, v6

    const/high16 v6, 0x4000

    div-float v4, v5, v6

    .local v4, tran_x:F
    neg-float v5, v4

    const/4 v6, 0x0

    invoke-virtual {v2, v5, v6}, Landroid/graphics/Matrix;->setTranslate(FF)V

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v5, v2}, Landroid/view/TextureView;->setTransform(Landroid/graphics/Matrix;)V

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v5, v9}, Landroid/view/TextureView;->setScaleX(F)V

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v5, v9}, Landroid/view/TextureView;->setScaleY(F)V

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v5, v5, Landroid/view/WindowManager$LayoutParams;->x:I

    iget-object v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v6, v6, Landroid/view/WindowManager$LayoutParams;->y:I

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->MH:I

    add-int/2addr v6, v7

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    iget v8, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    invoke-direct {p0, v5, v6, v7, v8}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->setInputRect(IIII)V

    .end local v1           #deviceMemory:Ljava/lang/String;
    .end local v4           #tran_x:F
    :goto_1
    return v10

    .restart local v1       #deviceMemory:Ljava/lang/String;
    :cond_1
    iget v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mRecordW:I

    iget v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    if-ne v5, v6, :cond_2

    iget v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mRecordH:I

    iget v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    if-ne v5, v6, :cond_2

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mRecordX:I

    iput v6, v5, Landroid/view/WindowManager$LayoutParams;->x:I

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mRecordY:I

    iput v6, v5, Landroid/view/WindowManager$LayoutParams;->y:I

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mRecordW:I

    iput v6, v5, Landroid/view/WindowManager$LayoutParams;->width:I

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mRecordH:I

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->MH:I

    add-int/2addr v6, v7

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->KH:I

    add-int/2addr v6, v7

    iput v6, v5, Landroid/view/WindowManager$LayoutParams;->height:I

    :goto_2
    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->isRight:Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_4

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalWidth:I

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    sub-int/2addr v6, v7

    iput v6, v5, Landroid/view/WindowManager$LayoutParams;->x:I

    goto :goto_0

    :cond_2
    iget v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mRecordX:I

    iget v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalWidth:I

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mRecordX:I

    sub-int/2addr v6, v7

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mRecordW:I

    sub-int/2addr v6, v7

    if-ge v5, v6, :cond_3

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iput v8, v5, Landroid/view/WindowManager$LayoutParams;->x:I

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalHeight:I

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    sub-int/2addr v6, v7

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->MH:I

    sub-int/2addr v6, v7

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->KH:I

    sub-int/2addr v6, v7

    add-int/lit8 v6, v6, -0x1

    iput v6, v5, Landroid/view/WindowManager$LayoutParams;->y:I

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    iput v6, v5, Landroid/view/WindowManager$LayoutParams;->width:I

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->MH:I

    add-int/2addr v6, v7

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->KH:I

    add-int/2addr v6, v7

    iput v6, v5, Landroid/view/WindowManager$LayoutParams;->height:I

    goto :goto_2

    :cond_3
    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalWidth:I

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    sub-int/2addr v6, v7

    iput v6, v5, Landroid/view/WindowManager$LayoutParams;->x:I

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalHeight:I

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    sub-int/2addr v6, v7

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->MH:I

    sub-int/2addr v6, v7

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->KH:I

    sub-int/2addr v6, v7

    add-int/lit8 v6, v6, -0x1

    iput v6, v5, Landroid/view/WindowManager$LayoutParams;->y:I

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    iput v6, v5, Landroid/view/WindowManager$LayoutParams;->width:I

    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->MH:I

    add-int/2addr v6, v7

    iget v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->KH:I

    add-int/2addr v6, v7

    iput v6, v5, Landroid/view/WindowManager$LayoutParams;->height:I

    goto :goto_2

    :cond_4
    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iput v8, v5, Landroid/view/WindowManager$LayoutParams;->x:I

    goto/16 :goto_0

    .end local v1           #deviceMemory:Ljava/lang/String;
    :pswitch_1
    iget-object v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const-string v6, "nubia_overlay_display_devices"

    const-string v7, ""

    invoke-static {v5, v6, v7}, Landroid/provider/Settings$Global;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    const-string v5, "zhanjin"

    const-string v6, "Rotion to land"

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private updateWindowPosition(I)V
    .locals 5
    .parameter "action"

    .prologue
    iget-boolean v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mIsLock:Z

    if-eqz v2, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->X:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mStartX:F

    sub-float/2addr v2, v3

    float-to-int v0, v2

    .local v0, tempX:I
    iget v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->Y:I

    int-to-float v2, v2

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mStartY:F

    sub-float/2addr v2, v3

    float-to-int v1, v2

    .local v1, tempY:I
    const/4 v2, 0x2

    if-ne p1, v2, :cond_4

    iget v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    add-int/2addr v2, v0

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalWidth:I

    if-le v2, v3, :cond_7

    iget v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalWidth:I

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    sub-int v0, v2, v3

    :cond_2
    :goto_1
    iget v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    add-int/2addr v2, v1

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->MH:I

    add-int/2addr v2, v3

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->KH:I

    add-int/2addr v2, v3

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalHeight:I

    if-le v2, v3, :cond_8

    iget v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalHeight:I

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    sub-int/2addr v2, v3

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->MH:I

    sub-int/2addr v2, v3

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->KH:I

    sub-int v1, v2, v3

    :cond_3
    :goto_2
    iget v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->MH:I

    add-int/2addr v2, v1

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    iget v4, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    invoke-direct {p0, v0, v2, v3, v4}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->setInputRect(IIII)V

    iget-object v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iput v0, v2, Landroid/view/WindowManager$LayoutParams;->x:I

    iget-object v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iput v1, v2, Landroid/view/WindowManager$LayoutParams;->y:I

    iget-object v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowManager:Landroid/view/WindowManager;

    iget-object v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContent:Landroid/widget/RelativeLayout;

    iget-object v4, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v2, v3, v4}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_4
    const/4 v2, 0x1

    if-ne p1, v2, :cond_0

    iget v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    add-int/2addr v2, v0

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalWidth:I

    if-le v2, v3, :cond_9

    iget v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalWidth:I

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    sub-int v0, v2, v3

    :cond_5
    :goto_3
    iget v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalWidth:I

    sub-int/2addr v2, v0

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    sub-int/2addr v2, v3

    if-le v2, v0, :cond_a

    const/4 v0, 0x0

    :goto_4
    iget v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    add-int/2addr v2, v1

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->MH:I

    add-int/2addr v2, v3

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->KH:I

    add-int/2addr v2, v3

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalHeight:I

    if-le v2, v3, :cond_b

    iget v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalHeight:I

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    sub-int/2addr v2, v3

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->MH:I

    sub-int/2addr v2, v3

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->KH:I

    sub-int v1, v2, v3

    :cond_6
    :goto_5
    iget v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->MH:I

    add-int/2addr v2, v1

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    iget v4, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    invoke-direct {p0, v0, v2, v3, v4}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->setInputRect(IIII)V

    iget-object v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iput v0, v2, Landroid/view/WindowManager$LayoutParams;->x:I

    iget-object v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iput v1, v2, Landroid/view/WindowManager$LayoutParams;->y:I

    iget-object v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowManager:Landroid/view/WindowManager;

    iget-object v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContent:Landroid/widget/RelativeLayout;

    iget-object v4, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v2, v3, v4}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto/16 :goto_0

    :cond_7
    if-gez v0, :cond_2

    const/4 v0, 0x0

    goto/16 :goto_1

    :cond_8
    if-gez v1, :cond_3

    const/4 v1, 0x0

    goto :goto_2

    :cond_9
    if-gez v0, :cond_5

    const/4 v0, 0x0

    goto :goto_3

    :cond_a
    iget v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLogicalWidth:I

    iget v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    sub-int v0, v2, v3

    goto :goto_4

    :cond_b
    if-gez v1, :cond_6

    const/4 v1, 0x0

    goto :goto_5
.end method


# virtual methods
.method public createDismissAnimation()V
    .locals 2

    .prologue
    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLockView:Landroid/widget/ImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowManager:Landroid/view/WindowManager;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContent:Landroid/widget/RelativeLayout;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowManager:Landroid/view/WindowManager;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContentBg:Landroid/view/View;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    const/4 v0, 0x0

    sput-boolean v0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowVisible:Z

    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mMutiWindowContentObserver:Lcom/android/server/display/nubiaOverlayDisplayWindow$MutiWindowContentObserver;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mMutiWindowContentObserver:Lcom/android/server/display/nubiaOverlayDisplayWindow$MutiWindowContentObserver;

    invoke-virtual {v0}, Lcom/android/server/display/nubiaOverlayDisplayWindow$MutiWindowContentObserver;->unobserve()V

    :cond_0
    return-void
.end method

.method public dismiss()V
    .locals 3

    .prologue
    sget-boolean v1, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowVisible:Z

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    iget-object v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDisplayListener:Landroid/hardware/display/DisplayManager$DisplayListener;

    invoke-virtual {v1, v2}, Landroid/hardware/display/DisplayManager;->unregisterDisplayListener(Landroid/hardware/display/DisplayManager$DisplayListener;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->x:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    iget v2, v2, Landroid/view/WindowManager$LayoutParams;->y:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mHeight:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWidth:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .local v0, mDeviceMem:Ljava/lang/String;
    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "nubia_overlay_display_devices_mermory"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Global;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    invoke-virtual {p0}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->createDismissAnimation()V

    .end local v0           #mDeviceMem:Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public dump(Ljava/io/PrintWriter;)V
    .locals 2
    .parameter "pw"

    .prologue
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mWindowVisible="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-boolean v1, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowVisible:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mWindowX="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowX:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mWindowY="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowY:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mWindowParams="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mTextureView:Landroid/view/TextureView;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mTextureView.getScaleX()="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v1}, Landroid/view/TextureView;->getScaleX()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mTextureView.getScaleY()="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mTextureView:Landroid/view/TextureView;

    invoke-virtual {v1}, Landroid/view/TextureView;->getScaleY()F

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mLiveTranslationX="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLiveTranslationX:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "mLiveTranslationY="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mLiveTranslationY:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    return-void
.end method

.method public onDoubleTouch()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v6, -0x2

    iget-object v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .local v0, cr:Landroid/content/ContentResolver;
    const-string v3, "single_ui_mode_sensor_switch"

    invoke-static {v0, v3, v7, v6}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v2

    .local v2, singleModeSensor:I
    const-string v3, "nubia_overlay_display_devices"

    invoke-static {v0, v3, v6}, Landroid/provider/Settings$Global;->getStringForUser(Landroid/content/ContentResolver;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    .local v1, screenStatus:Ljava/lang/String;
    const-string v3, "NubiaOverlayDisplayWindow"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onDoubleTouch,singleModeSensor="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ,mIsLock="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v5, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mIsLock:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " ,screenStatus="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-boolean v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mIsLock:Z

    if-eqz v3, :cond_1

    iput-boolean v7, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mIsLock:Z

    const-string v3, "NubiaOverlayDisplayWindow"

    const-string v4, "onDoubleTouch,do unlock"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mMoveStatusView:Landroid/widget/ImageView;

    const v4, 0x10805d8

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    if-nez v2, :cond_0

    const-string v3, "single_ui_mode_sensor_switch"

    invoke-static {v0, v3, v8, v6}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    :cond_0
    :goto_0
    return-void

    :cond_1
    if-ne v2, v8, :cond_0

    const-string v3, ""

    if-eq v3, v1, :cond_0

    const-string v3, "NubiaOverlayDisplayWindow"

    const-string v4, "onDoubleTouch,do lock"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v3, "single_ui_mode_sensor_switch"

    invoke-static {v0, v3, v7, v6}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    iget-object v3, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mMoveStatusView:Landroid/widget/ImageView;

    const v4, 0x10805d5

    invoke-virtual {v3, v4}, Landroid/widget/ImageView;->setImageResource(I)V

    iput-boolean v8, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mIsLock:Z

    goto :goto_0
.end method

.method public onSingleTouch()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    const/4 v5, -0x2

    const-string v2, "NubiaOverlayDisplayWindow"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onSingleTouch,mIsLock="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mIsLock:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .local v0, cr:Landroid/content/ContentResolver;
    const-string v2, "nubia_overlay_display_devices"

    const-string v3, ""

    invoke-static {v0, v2, v3}, Landroid/provider/Settings$Global;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    iget-boolean v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mIsLock:Z

    if-eqz v2, :cond_0

    iput-boolean v6, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mIsLock:Z

    const-string v2, "single_ui_mode_sensor_switch"

    invoke-static {v0, v2, v6, v5}, Landroid/provider/Settings$System;->getIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)I

    move-result v1

    .local v1, singleModeSensor:I
    if-nez v1, :cond_0

    const-string v2, "single_ui_mode_sensor_switch"

    const/4 v3, 0x1

    invoke-static {v0, v2, v3, v5}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    .end local v1           #singleModeSensor:I
    :cond_0
    return-void
.end method

.method public sendInjectEvent(II)V
    .locals 15
    .parameter "action"
    .parameter "actionCode"

    .prologue
    packed-switch p1, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->downTime:J

    iget-wide v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->downTime:J

    iget-wide v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->downTime:J

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, -0x1

    const/4 v9, 0x0

    const/16 v10, 0x8

    const/16 v11, 0x101

    const/4 v12, 0x0

    move/from16 v5, p2

    invoke-static/range {v0 .. v12}, Landroid/view/KeyEvent;->obtain(JJIIIIIIIILjava/lang/String;)Landroid/view/KeyEvent;

    move-result-object v13

    .local v13, down:Landroid/view/KeyEvent;
    invoke-static {}, Landroid/hardware/input/InputManager;->getInstance()Landroid/hardware/input/InputManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v13, v1}, Landroid/hardware/input/InputManager;->injectInputEvent(Landroid/view/InputEvent;I)Z

    invoke-virtual {v13}, Landroid/view/KeyEvent;->recycle()V

    goto :goto_0

    .end local v13           #down:Landroid/view/KeyEvent;
    :pswitch_1
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->upTime:J

    iget-wide v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->downTime:J

    iget-wide v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->upTime:J

    const/4 v4, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, -0x1

    const/4 v9, 0x0

    const/16 v10, 0x8

    const/16 v11, 0x101

    const/4 v12, 0x0

    move/from16 v5, p2

    invoke-static/range {v0 .. v12}, Landroid/view/KeyEvent;->obtain(JJIIIIIIIILjava/lang/String;)Landroid/view/KeyEvent;

    move-result-object v14

    .local v14, up:Landroid/view/KeyEvent;
    invoke-static {}, Landroid/hardware/input/InputManager;->getInstance()Landroid/hardware/input/InputManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v14, v1}, Landroid/hardware/input/InputManager;->injectInputEvent(Landroid/view/InputEvent;I)Z

    invoke-virtual {v14}, Landroid/view/KeyEvent;->recycle()V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public show()V
    .locals 3

    .prologue
    sget-boolean v0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowVisible:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDisplayListener:Landroid/hardware/display/DisplayManager$DisplayListener;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/hardware/display/DisplayManager;->registerDisplayListener(Landroid/hardware/display/DisplayManager$DisplayListener;Landroid/os/Handler;)V

    invoke-direct {p0}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->updateDefaultDisplayInfo()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDisplayManager:Landroid/hardware/display/DisplayManager;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mDisplayListener:Landroid/hardware/display/DisplayManager$DisplayListener;

    invoke-virtual {v0, v1}, Landroid/hardware/display/DisplayManager;->unregisterDisplayListener(Landroid/hardware/display/DisplayManager$DisplayListener;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-direct {p0}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->updateWindowParams()Z

    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowManager:Landroid/view/WindowManager;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContentBg:Landroid/view/View;

    iget-object v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams2:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v0, v1, v2}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowManager:Landroid/view/WindowManager;

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowContent:Landroid/widget/RelativeLayout;

    iget-object v2, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mWindowParams:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v0, v1, v2}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-direct {p0}, Lcom/android/server/display/nubiaOverlayDisplayWindow;->createShowAnimation()V

    goto :goto_0
.end method

.method public updateSUMode()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "ss_multi_window_enabled"

    invoke-static {v1, v2, v4}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .local v0, isMultiWindow:I
    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v1, p0, Lcom/android/server/display/nubiaOverlayDisplayWindow;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "single_ui_mode"

    const/4 v3, -0x2

    invoke-static {v1, v2, v4, v3}, Landroid/provider/Settings$System;->putIntForUser(Landroid/content/ContentResolver;Ljava/lang/String;II)Z

    :cond_0
    return-void
.end method
