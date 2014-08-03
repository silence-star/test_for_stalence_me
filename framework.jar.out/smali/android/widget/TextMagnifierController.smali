.class public Landroid/widget/TextMagnifierController;
.super Lnubia/ui/widget/MagnifierController;
.source "TextMagnifierController.java"


# instance fields
.field private final mEditor:Landroid/widget/Editor;

.field private mLastRawX:F

.field private mLastRawY:F

.field private mOffset:I

.field private final mTextView:Landroid/widget/TextView;

.field private final mThresholdMoveDistance:I


# direct methods
.method public constructor <init>(Landroid/widget/Editor;)V
    .locals 1
    .parameter "editor"

    .prologue
    invoke-virtual {p1}, Landroid/widget/Editor;->textview()Landroid/widget/TextView;

    move-result-object v0

    invoke-direct {p0, v0}, Lnubia/ui/widget/MagnifierController;-><init>(Landroid/view/View;)V

    const/4 v0, -0x1

    iput v0, p0, Landroid/widget/TextMagnifierController;->mOffset:I

    iput-object p1, p0, Landroid/widget/TextMagnifierController;->mEditor:Landroid/widget/Editor;

    invoke-virtual {p1}, Landroid/widget/Editor;->textview()Landroid/widget/TextView;

    move-result-object v0

    iput-object v0, p0, Landroid/widget/TextMagnifierController;->mTextView:Landroid/widget/TextView;

    iget-object v0, p0, Landroid/widget/TextMagnifierController;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getLineHeight()I

    move-result v0

    iput v0, p0, Landroid/widget/TextMagnifierController;->mThresholdMoveDistance:I

    return-void
.end method

.method private initLongClickXY()V
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/widget/TextMagnifierController;->mEditor:Landroid/widget/Editor;

    iget v0, v0, Landroid/widget/Editor;->mLastDownPositionX:F

    float-to-int v0, v0

    iput v0, p0, Landroid/widget/TextMagnifierController;->mLongClickX:I

    iget-object v0, p0, Landroid/widget/TextMagnifierController;->mEditor:Landroid/widget/Editor;

    iget v0, v0, Landroid/widget/Editor;->mLastDownPositionY:F

    float-to-int v0, v0

    iput v0, p0, Landroid/widget/TextMagnifierController;->mLongClickY:I

    return-void
.end method


# virtual methods
.method public onHandleController(Landroid/view/MotionEvent;)V
    .locals 2
    .parameter "event"

    .prologue
    iget-object v0, p0, Landroid/widget/TextMagnifierController;->mEditor:Landroid/widget/Editor;

    invoke-virtual {v0}, Landroid/widget/Editor;->getInsertionController()Landroid/widget/NubiaCursorController;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Landroid/widget/NubiaCursorController;->onHandleTouchEvent(Landroid/widget/NubiaCursorController$NubiaHandleView;Landroid/view/MotionEvent;)Z

    return-void
.end method

.method public onPostHide()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    iget-object v0, p0, Landroid/widget/TextMagnifierController;->mEditor:Landroid/widget/Editor;

    invoke-virtual {v0}, Landroid/widget/Editor;->makeBlink()V

    iput v1, p0, Landroid/widget/TextMagnifierController;->mLastRawX:F

    iput v1, p0, Landroid/widget/TextMagnifierController;->mLastRawY:F

    return-void
.end method

.method public onPreShow()V
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/widget/TextMagnifierController;->mEditor:Landroid/widget/Editor;

    invoke-virtual {v0}, Landroid/widget/Editor;->stopBlink()V

    return-void
.end method

.method public onUpdatePosition(Landroid/view/MotionEvent;)Z
    .locals 9
    .parameter "event"

    .prologue
    if-nez p1, :cond_1

    invoke-direct {p0}, Landroid/widget/TextMagnifierController;->initLongClickXY()V

    const/4 v3, 0x1

    :cond_0
    :goto_0
    return v3

    :cond_1
    const/4 v3, 0x0

    .local v3, update:Z
    iget-object v6, p0, Landroid/widget/TextMagnifierController;->mTextView:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v8

    invoke-virtual {v6, v7, v8}, Landroid/widget/TextView;->getOffsetForPosition(FF)I

    move-result v2

    .local v2, offset:I
    iget v6, p0, Landroid/widget/TextMagnifierController;->mOffset:I

    if-eq v2, v6, :cond_2

    iput v2, p0, Landroid/widget/TextMagnifierController;->mOffset:I

    iget-object v6, p0, Landroid/widget/TextMagnifierController;->mEditor:Landroid/widget/Editor;

    invoke-virtual {v6, v2}, Landroid/widget/Editor;->setTextSelection(I)V

    const/4 v3, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v4

    .local v4, xraw:F
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    move-result v5

    .local v5, yraw:F
    iget v6, p0, Landroid/widget/TextMagnifierController;->mLastRawX:F

    sub-float v0, v4, v6

    .local v0, dx:F
    iget v6, p0, Landroid/widget/TextMagnifierController;->mLastRawY:F

    sub-float v1, v5, v6

    .local v1, dy:F
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v6

    iget v7, p0, Landroid/widget/TextMagnifierController;->mThresholdMoveDistance:I

    int-to-float v7, v7

    cmpl-float v6, v6, v7

    if-gtz v6, :cond_3

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v6

    iget v7, p0, Landroid/widget/TextMagnifierController;->mThresholdMoveDistance:I

    int-to-float v7, v7

    cmpl-float v6, v6, v7

    if-lez v6, :cond_0

    :cond_3
    iput v4, p0, Landroid/widget/TextMagnifierController;->mLastRawX:F

    iput v5, p0, Landroid/widget/TextMagnifierController;->mLastRawY:F

    const/4 v3, 0x1

    goto :goto_0
.end method
