.class public Lnubia/ui/widget/BezierView;
.super Landroid/view/View;
.source "BezierView.java"


# static fields
.field private static final COUNT_STEP:I = 0x8

.field private static final MIDDLE_FRAMES:I = 0x9

.field private static final MSG_INVALIDATE:I = 0x1

.field private static final NO_DRAW_STATUS:I = -0x1

.field private static final TAG:Ljava/lang/String; = "BezierView"

.field private static final TOTAL_COUNT_FRAME:I = 0x14


# instance fields
.field private animationSwitch:I

.field private mArcHeight:I

.field private mHandler:Landroid/os/Handler;

.field private mHeight:I

.field private mIsContinue:Z

.field private mIsRunning:Z

.field private mNumFrame:I

.field private mPaint:Landroid/graphics/Paint;

.field private mPath:Landroid/graphics/Path;

.field private mShowOnTop:Z

.field private final mStartY:I

.field private final mStep:I

.field private mVisibleScreenWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lnubia/ui/widget/BezierView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lnubia/ui/widget/BezierView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnubia/ui/widget/BezierView;->mShowOnTop:Z

    const/4 v0, -0x1

    iput v0, p0, Lnubia/ui/widget/BezierView;->mNumFrame:I

    new-instance v0, Lnubia/ui/widget/BezierView$1;

    invoke-direct {v0, p0}, Lnubia/ui/widget/BezierView$1;-><init>(Lnubia/ui/widget/BezierView;)V

    iput-object v0, p0, Lnubia/ui/widget/BezierView;->mHandler:Landroid/os/Handler;

    invoke-direct {p0}, Lnubia/ui/widget/BezierView;->initPaint()V

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x105008d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lnubia/ui/widget/BezierView;->mHeight:I

    iget v0, p0, Lnubia/ui/widget/BezierView;->mHeight:I

    div-int/lit8 v0, v0, 0x8

    iput v0, p0, Lnubia/ui/widget/BezierView;->mStep:I

    iget v0, p0, Lnubia/ui/widget/BezierView;->mHeight:I

    div-int/lit8 v0, v0, 0x2

    iput v0, p0, Lnubia/ui/widget/BezierView;->mStartY:I

    iget-object v0, p0, Lnubia/ui/widget/BezierView;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lnubia/ui/util/UiUtils;->getAnimationSwitch(Landroid/content/Context;)I

    move-result v0

    iput v0, p0, Lnubia/ui/widget/BezierView;->animationSwitch:I

    return-void
.end method

.method static synthetic access$004(Lnubia/ui/widget/BezierView;)I
    .locals 1
    .parameter "x0"

    .prologue
    iget v0, p0, Lnubia/ui/widget/BezierView;->mNumFrame:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnubia/ui/widget/BezierView;->mNumFrame:I

    return v0
.end method

.method private calDynamicArcHeight(II)V
    .locals 2
    .parameter "showLocation"
    .parameter "numberFrame"

    .prologue
    const/16 v1, 0xf

    const/16 v0, 0x8

    packed-switch p1, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    if-nez p2, :cond_0

    iget v0, p0, Lnubia/ui/widget/BezierView;->mHeight:I

    iput v0, p0, Lnubia/ui/widget/BezierView;->mArcHeight:I

    goto :goto_0

    :cond_0
    if-gt p2, v0, :cond_1

    iget v0, p0, Lnubia/ui/widget/BezierView;->mArcHeight:I

    iget v1, p0, Lnubia/ui/widget/BezierView;->mStep:I

    sub-int/2addr v0, v1

    iput v0, p0, Lnubia/ui/widget/BezierView;->mArcHeight:I

    goto :goto_0

    :cond_1
    if-ge v0, p2, :cond_2

    if-gt p2, v1, :cond_2

    iget v0, p0, Lnubia/ui/widget/BezierView;->mArcHeight:I

    iget v1, p0, Lnubia/ui/widget/BezierView;->mStep:I

    add-int/2addr v0, v1

    iput v0, p0, Lnubia/ui/widget/BezierView;->mArcHeight:I

    goto :goto_0

    :cond_2
    iget v0, p0, Lnubia/ui/widget/BezierView;->mArcHeight:I

    iget v1, p0, Lnubia/ui/widget/BezierView;->mStep:I

    sub-int/2addr v0, v1

    iput v0, p0, Lnubia/ui/widget/BezierView;->mArcHeight:I

    goto :goto_0

    :pswitch_1
    if-nez p2, :cond_3

    const/4 v0, 0x0

    iput v0, p0, Lnubia/ui/widget/BezierView;->mArcHeight:I

    goto :goto_0

    :cond_3
    if-gt p2, v0, :cond_4

    iget v0, p0, Lnubia/ui/widget/BezierView;->mArcHeight:I

    iget v1, p0, Lnubia/ui/widget/BezierView;->mStep:I

    add-int/2addr v0, v1

    iput v0, p0, Lnubia/ui/widget/BezierView;->mArcHeight:I

    goto :goto_0

    :cond_4
    if-ge v0, p2, :cond_5

    if-gt p2, v1, :cond_5

    iget v0, p0, Lnubia/ui/widget/BezierView;->mArcHeight:I

    iget v1, p0, Lnubia/ui/widget/BezierView;->mStep:I

    sub-int/2addr v0, v1

    iput v0, p0, Lnubia/ui/widget/BezierView;->mArcHeight:I

    goto :goto_0

    :cond_5
    iget v0, p0, Lnubia/ui/widget/BezierView;->mArcHeight:I

    iget v1, p0, Lnubia/ui/widget/BezierView;->mStep:I

    add-int/2addr v0, v1

    iput v0, p0, Lnubia/ui/widget/BezierView;->mArcHeight:I

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private drawLastFrame(Landroid/graphics/Canvas;Z)V
    .locals 9
    .parameter "canvas"
    .parameter "isOnTop"

    .prologue
    const/4 v8, 0x0

    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    iget v2, p0, Lnubia/ui/widget/BezierView;->mVisibleScreenWidth:I

    .local v2, screenWidth:I
    div-int/lit8 v0, v2, 0x2

    .local v0, controlX:I
    iget v3, p0, Lnubia/ui/widget/BezierView;->mHeight:I

    div-int/lit8 v1, v3, 0x4

    .local v1, controlY:I
    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    iget v4, p0, Lnubia/ui/widget/BezierView;->mStartY:I

    int-to-float v4, v4

    invoke-virtual {v3, v8, v4}, Landroid/graphics/Path;->moveTo(FF)V

    if-eqz p2, :cond_0

    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    int-to-float v4, v0

    int-to-float v5, v1

    int-to-float v6, v2

    iget v7, p0, Lnubia/ui/widget/BezierView;->mStartY:I

    int-to-float v7, v7

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/Path;->quadTo(FFFF)V

    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    int-to-float v4, v2

    iget v5, p0, Lnubia/ui/widget/BezierView;->mHeight:I

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    iget v4, p0, Lnubia/ui/widget/BezierView;->mHeight:I

    int-to-float v4, v4

    invoke-virtual {v3, v8, v4}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    iget v4, p0, Lnubia/ui/widget/BezierView;->mStartY:I

    int-to-float v4, v4

    invoke-virtual {v3, v8, v4}, Landroid/graphics/Path;->lineTo(FF)V

    :goto_0
    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    iget-object v4, p0, Lnubia/ui/widget/BezierView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void

    :cond_0
    iget v3, p0, Lnubia/ui/widget/BezierView;->mHeight:I

    mul-int/lit8 v3, v3, 0x3

    div-int/lit8 v1, v3, 0x4

    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    int-to-float v4, v0

    int-to-float v5, v1

    int-to-float v6, v2

    iget v7, p0, Lnubia/ui/widget/BezierView;->mStartY:I

    int-to-float v7, v7

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/Path;->quadTo(FFFF)V

    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    int-to-float v4, v2

    invoke-virtual {v3, v4, v8}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v3, v8, v8}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    iget v4, p0, Lnubia/ui/widget/BezierView;->mStartY:I

    int-to-float v4, v4

    invoke-virtual {v3, v8, v4}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_0
.end method

.method private drawQpath(Landroid/graphics/Canvas;)V
    .locals 9
    .parameter "canvas"

    .prologue
    const/4 v8, 0x0

    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    iget v4, p0, Lnubia/ui/widget/BezierView;->mStartY:I

    int-to-float v4, v4

    invoke-virtual {v3, v8, v4}, Landroid/graphics/Path;->moveTo(FF)V

    iget v2, p0, Lnubia/ui/widget/BezierView;->mVisibleScreenWidth:I

    .local v2, screenWidth:I
    div-int/lit8 v0, v2, 0x2

    .local v0, controlX:I
    iget v3, p0, Lnubia/ui/widget/BezierView;->mArcHeight:I

    mul-int/lit8 v3, v3, 0x2

    iget v4, p0, Lnubia/ui/widget/BezierView;->mStartY:I

    sub-int v1, v3, v4

    .local v1, controlY:I
    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    int-to-float v4, v0

    int-to-float v5, v1

    int-to-float v6, v2

    iget v7, p0, Lnubia/ui/widget/BezierView;->mStartY:I

    int-to-float v7, v7

    invoke-virtual {v3, v4, v5, v6, v7}, Landroid/graphics/Path;->quadTo(FFFF)V

    iget-boolean v3, p0, Lnubia/ui/widget/BezierView;->mShowOnTop:Z

    if-eqz v3, :cond_0

    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    int-to-float v4, v2

    iget v5, p0, Lnubia/ui/widget/BezierView;->mHeight:I

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    iget v4, p0, Lnubia/ui/widget/BezierView;->mHeight:I

    int-to-float v4, v4

    invoke-virtual {v3, v8, v4}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    iget v4, p0, Lnubia/ui/widget/BezierView;->mStartY:I

    int-to-float v4, v4

    invoke-virtual {v3, v8, v4}, Landroid/graphics/Path;->lineTo(FF)V

    :goto_0
    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v3}, Landroid/graphics/Path;->close()V

    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    iget-object v4, p0, Lnubia/ui/widget/BezierView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void

    :cond_0
    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    int-to-float v4, v2

    invoke-virtual {v3, v4, v8}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    invoke-virtual {v3, v8, v8}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v3, p0, Lnubia/ui/widget/BezierView;->mPath:Landroid/graphics/Path;

    iget v4, p0, Lnubia/ui/widget/BezierView;->mStartY:I

    int-to-float v4, v4

    invoke-virtual {v3, v8, v4}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_0
.end method

.method private getScreenWidth(Landroid/content/Context;)I
    .locals 4
    .parameter "context"

    .prologue
    const-string v3, "window"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager;

    .local v2, windowManager:Landroid/view/WindowManager;
    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v0

    .local v0, display:Landroid/view/Display;
    new-instance v1, Landroid/graphics/Point;

    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .local v1, point:Landroid/graphics/Point;
    invoke-virtual {v0, v1}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    iget v3, v1, Landroid/graphics/Point;->x:I

    return v3
.end method

.method private initPaint()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lnubia/ui/widget/BezierView;->mPaint:Landroid/graphics/Paint;

    iget-object v0, p0, Lnubia/ui/widget/BezierView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    iget-object v0, p0, Lnubia/ui/widget/BezierView;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lnubia/ui/widget/BezierView;->mPaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method

.method private measureWidth(I)I
    .locals 3
    .parameter "widthMeasureSpec"

    .prologue
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .local v0, specMode:I
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .local v1, specSize:I
    const/high16 v2, 0x4000

    if-eq v0, v2, :cond_0

    iget-object v2, p0, Lnubia/ui/widget/BezierView;->mContext:Landroid/content/Context;

    invoke-direct {p0, v2}, Lnubia/ui/widget/BezierView;->getScreenWidth(Landroid/content/Context;)I

    move-result v1

    :cond_0
    return v1
.end method


# virtual methods
.method public continueBezierAnimation()V
    .locals 4

    .prologue
    const/4 v0, 0x0

    const/4 v3, 0x1

    iget-boolean v1, p0, Lnubia/ui/widget/BezierView;->mIsRunning:Z

    if-nez v1, :cond_1

    iget v1, p0, Lnubia/ui/widget/BezierView;->mNumFrame:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    iput v0, p0, Lnubia/ui/widget/BezierView;->mNumFrame:I

    :cond_0
    iput-boolean v3, p0, Lnubia/ui/widget/BezierView;->mIsRunning:Z

    iput-boolean v3, p0, Lnubia/ui/widget/BezierView;->mIsContinue:Z

    iget-object v0, p0, Lnubia/ui/widget/BezierView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v3}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :goto_0
    return-void

    :cond_1
    const/16 v1, 0xa

    iput v1, p0, Lnubia/ui/widget/BezierView;->mNumFrame:I

    iget-boolean v1, p0, Lnubia/ui/widget/BezierView;->mShowOnTop:Z

    if-eqz v1, :cond_2

    :goto_1
    iput v0, p0, Lnubia/ui/widget/BezierView;->mArcHeight:I

    invoke-virtual {p0}, Lnubia/ui/widget/BezierView;->invalidate()V

    goto :goto_0

    :cond_2
    iget v0, p0, Lnubia/ui/widget/BezierView;->mHeight:I

    goto :goto_1
.end method

.method public getBezierViewHeight()I
    .locals 1

    .prologue
    iget v0, p0, Lnubia/ui/widget/BezierView;->mHeight:I

    return v0
.end method

.method public isOnTop()Z
    .locals 1

    .prologue
    iget-boolean v0, p0, Lnubia/ui/widget/BezierView;->mShowOnTop:Z

    return v0
.end method

.method public isRunning()Z
    .locals 1

    .prologue
    iget-boolean v0, p0, Lnubia/ui/widget/BezierView;->mIsRunning:Z

    return v0
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .prologue
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    invoke-virtual {p0}, Lnubia/ui/widget/BezierView;->stopRunning()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6
    .parameter "canvas"

    .prologue
    const/16 v5, 0x9

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->drawColor(I)V

    iget v3, p0, Lnubia/ui/widget/BezierView;->mNumFrame:I

    const/4 v4, -0x1

    if-ne v3, v4, :cond_0

    :goto_0
    return-void

    :cond_0
    iget v3, p0, Lnubia/ui/widget/BezierView;->animationSwitch:I

    if-eqz v3, :cond_1

    iget-boolean v1, p0, Lnubia/ui/widget/BezierView;->mShowOnTop:Z

    invoke-direct {p0, p1, v1}, Lnubia/ui/widget/BezierView;->drawLastFrame(Landroid/graphics/Canvas;Z)V

    goto :goto_0

    :cond_1
    iget-boolean v3, p0, Lnubia/ui/widget/BezierView;->mShowOnTop:Z

    if-eqz v3, :cond_2

    move v0, v1

    .local v0, showLocation:I
    :goto_1
    iget-boolean v3, p0, Lnubia/ui/widget/BezierView;->mIsRunning:Z

    if-eqz v3, :cond_6

    iget v3, p0, Lnubia/ui/widget/BezierView;->mNumFrame:I

    invoke-direct {p0, v0, v3}, Lnubia/ui/widget/BezierView;->calDynamicArcHeight(II)V

    invoke-direct {p0, p1}, Lnubia/ui/widget/BezierView;->drawQpath(Landroid/graphics/Canvas;)V

    iget v3, p0, Lnubia/ui/widget/BezierView;->mNumFrame:I

    if-gt v3, v5, :cond_4

    iget v1, p0, Lnubia/ui/widget/BezierView;->mNumFrame:I

    if-ne v1, v5, :cond_3

    iget-boolean v1, p0, Lnubia/ui/widget/BezierView;->mIsContinue:Z

    if-nez v1, :cond_3

    iput-boolean v2, p0, Lnubia/ui/widget/BezierView;->mIsRunning:Z

    goto :goto_0

    .end local v0           #showLocation:I
    :cond_2
    move v0, v2

    goto :goto_1

    .restart local v0       #showLocation:I
    :cond_3
    iget v1, p0, Lnubia/ui/widget/BezierView;->mNumFrame:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lnubia/ui/widget/BezierView;->mNumFrame:I

    invoke-virtual {p0}, Lnubia/ui/widget/BezierView;->invalidate()V

    goto :goto_0

    :cond_4
    iget v3, p0, Lnubia/ui/widget/BezierView;->mNumFrame:I

    const/16 v4, 0x14

    if-ge v3, v4, :cond_5

    iget-object v2, p0, Lnubia/ui/widget/BezierView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v2, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    :cond_5
    iput-boolean v2, p0, Lnubia/ui/widget/BezierView;->mIsRunning:Z

    iput-boolean v2, p0, Lnubia/ui/widget/BezierView;->mIsContinue:Z

    goto :goto_0

    :cond_6
    if-ne v0, v1, :cond_7

    iget v1, p0, Lnubia/ui/widget/BezierView;->mHeight:I

    div-int/lit8 v1, v1, 0x4

    :goto_2
    iput v1, p0, Lnubia/ui/widget/BezierView;->mArcHeight:I

    invoke-direct {p0, p1}, Lnubia/ui/widget/BezierView;->drawQpath(Landroid/graphics/Canvas;)V

    goto :goto_0

    :cond_7
    iget v1, p0, Lnubia/ui/widget/BezierView;->mHeight:I

    mul-int/lit8 v1, v1, 0x3

    div-int/lit8 v1, v1, 0x4

    goto :goto_2
.end method

.method protected onLayout(ZIIII)V
    .locals 1
    .parameter "changed"
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    sub-int v0, p4, p2

    iput v0, p0, Lnubia/ui/widget/BezierView;->mVisibleScreenWidth:I

    return-void
.end method

.method protected onMeasure(II)V
    .locals 2
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    invoke-direct {p0, p1}, Lnubia/ui/widget/BezierView;->measureWidth(I)I

    move-result v0

    iget v1, p0, Lnubia/ui/widget/BezierView;->mHeight:I

    invoke-virtual {p0, v0, v1}, Lnubia/ui/widget/BezierView;->setMeasuredDimension(II)V

    return-void
.end method

.method public setShowOnTop(Z)V
    .locals 0
    .parameter "isOnTop"

    .prologue
    iput-boolean p1, p0, Lnubia/ui/widget/BezierView;->mShowOnTop:Z

    return-void
.end method

.method public startBezierAnimation()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    iget-boolean v0, p0, Lnubia/ui/widget/BezierView;->mIsRunning:Z

    if-nez v0, :cond_0

    iput-boolean v1, p0, Lnubia/ui/widget/BezierView;->mIsRunning:Z

    const/4 v0, -0x1

    iput v0, p0, Lnubia/ui/widget/BezierView;->mNumFrame:I

    iget-object v0, p0, Lnubia/ui/widget/BezierView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :cond_0
    return-void
.end method

.method public stopRunning()V
    .locals 2

    .prologue
    const/4 v1, 0x1

    iget-boolean v0, p0, Lnubia/ui/widget/BezierView;->mIsRunning:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lnubia/ui/widget/BezierView;->mIsRunning:Z

    iget-object v0, p0, Lnubia/ui/widget/BezierView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnubia/ui/widget/BezierView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    :cond_0
    return-void
.end method

.method public declared-synchronized updateArcHeight(I)V
    .locals 1
    .parameter "arcHeight"

    .prologue
    monitor-enter p0

    :try_start_0
    iput p1, p0, Lnubia/ui/widget/BezierView;->mArcHeight:I

    invoke-virtual {p0}, Lnubia/ui/widget/BezierView;->invalidate()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
