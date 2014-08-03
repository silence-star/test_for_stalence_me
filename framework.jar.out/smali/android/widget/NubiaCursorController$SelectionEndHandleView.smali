.class Landroid/widget/NubiaCursorController$SelectionEndHandleView;
.super Landroid/widget/NubiaCursorController$NubiaHandleView;
.source "NubiaCursorController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/widget/NubiaCursorController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SelectionEndHandleView"
.end annotation


# instance fields
.field final synthetic this$0:Landroid/widget/NubiaCursorController;


# direct methods
.method public constructor <init>(Landroid/widget/NubiaCursorController;Landroid/widget/Editor;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .parameter
    .parameter "editor"
    .parameter "drawableLtr"
    .parameter "drawableRtl"

    .prologue
    iput-object p1, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->this$0:Landroid/widget/NubiaCursorController;

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/NubiaCursorController$NubiaHandleView;-><init>(Landroid/widget/NubiaCursorController;Landroid/widget/Editor;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method protected getCurrentCursorOffset()I
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getSelectionEnd()I

    move-result v0

    return v0
.end method

.method public getHotspotLocationOnScreen([I)V
    .locals 3
    .parameter "outLocation"

    .prologue
    const/4 v0, 0x0

    iget v1, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mContainerX:I

    iget v2, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mHotspotX:I

    add-int/2addr v1, v2

    aput v1, p1, v0

    const/4 v0, 0x1

    iget v1, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mContainerY:I

    iget v2, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mLineHeight:I

    add-int/2addr v1, v2

    aput v1, p1, v0

    return-void
.end method

.method protected getHotspotX(Landroid/graphics/drawable/Drawable;Z)I
    .locals 2
    .parameter "drawable"
    .parameter "isRtlRun"

    .prologue
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    iget v1, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mRatio:F

    mul-float/2addr v0, v1

    float-to-int v0, v0

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 10
    .parameter "canvas"

    .prologue
    const/4 v9, 0x0

    iget-object v6, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mDrawableMark:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    .local v4, markWidth:I
    iget-object v6, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    .local v0, dHeight:I
    iget v6, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mRight:I

    iget v7, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mLeft:I

    sub-int/2addr v6, v7

    sub-int/2addr v6, v4

    div-int/lit8 v2, v6, 0x2

    .local v2, markLeft:I
    add-int v3, v2, v4

    .local v3, markRight:I
    iget v6, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mBottom:I

    int-to-float v6, v6

    int-to-float v7, v0

    iget v8, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mRatio:F

    mul-float/2addr v7, v8

    sub-float/2addr v6, v7

    float-to-int v1, v6

    .local v1, markBottom:I
    iget-object v6, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mDrawableMark:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6, v2, v9, v3, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v6, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mDrawableMark:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget v6, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mBottom:I

    int-to-float v6, v6

    int-to-float v7, v0

    iget v8, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mRatio:F

    mul-float/2addr v7, v8

    sub-float/2addr v6, v7

    float-to-int v5, v6

    .local v5, top:I
    iget-object v6, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mDrawable:Landroid/graphics/drawable/Drawable;

    iget v7, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mRight:I

    iget v8, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mBottom:I

    invoke-virtual {v6, v9, v5, v7, v8}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v6, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v6, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method protected updateContainerSize()V
    .locals 6

    .prologue
    const/high16 v4, 0x3f80

    iget-object v2, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getLineHeight()I

    move-result v1

    .local v1, lineheight:I
    iget v2, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mLineHeight:I

    if-ne v2, v1, :cond_0

    :goto_0
    return-void

    :cond_0
    iput v1, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mLineHeight:I

    int-to-float v2, v1

    iget v3, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mMarkHeightMatchHandleHeight:I

    int-to-float v3, v3

    div-float v0, v2, v3

    .local v0, lineRatio:F
    iget v2, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mMinHandleRatio:F

    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v2

    iput v2, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mRatio:F

    iget v2, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mRatio:F

    cmpl-float v2, v2, v4

    if-lez v2, :cond_1

    iput v4, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mRatio:F

    :cond_1
    iget-object v2, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mContainer:Landroid/widget/PopupWindow;

    iget-object v3, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    int-to-float v3, v3

    iget v4, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mRatio:F

    mul-float/2addr v3, v4

    float-to-int v3, v3

    invoke-virtual {v2, v3}, Landroid/widget/PopupWindow;->setWidth(I)V

    iget-object v2, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mContainer:Landroid/widget/PopupWindow;

    int-to-float v3, v1

    iget-object v4, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    int-to-float v4, v4

    iget v5, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mRatio:F

    mul-float/2addr v4, v5

    add-float/2addr v3, v4

    float-to-int v3, v3

    invoke-virtual {v2, v3}, Landroid/widget/PopupWindow;->setHeight(I)V

    iput v1, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mHandleTypeOffset:I

    const v2, -0x41666666

    int-to-float v3, v1

    mul-float/2addr v2, v3

    iput v2, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mTouchOffsetY:F

    const v2, 0x3f333333

    int-to-float v3, v1

    mul-float/2addr v2, v3

    iput v2, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mIdealVerticalOffset:F

    goto :goto_0
.end method

.method public updatePosition(FF)V
    .locals 4
    .parameter "x"
    .parameter "y"

    .prologue
    iget-object v2, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v2, p1, p2}, Landroid/widget/TextView;->getOffsetForPosition(FF)I

    move-result v0

    .local v0, offset:I
    iget-object v2, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getSelectionStart()I

    move-result v1

    .local v1, selectionStart:I
    if-gt v0, v1, :cond_0

    add-int/lit8 v2, v1, 0x1

    iget-object v3, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    :cond_0
    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2}, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->positionAtCursorOffset(IZ)V

    return-void
.end method

.method protected updatePositionXY(IZ)V
    .locals 5
    .parameter "offset"
    .parameter "hasPositionChanged"

    .prologue
    iget-object v3, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v0

    .local v0, layout:Landroid/text/Layout;
    invoke-virtual {v0, p1}, Landroid/text/Layout;->getLineForOffset(I)I

    move-result v1

    .local v1, line:I
    invoke-virtual {v0, p1}, Landroid/text/Layout;->getPrimaryHorizontal(I)F

    move-result v3

    const/high16 v4, 0x3f00

    sub-float/2addr v3, v4

    iget v4, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mHotspotX:I

    int-to-float v4, v4

    sub-float/2addr v3, v4

    float-to-int v3, v3

    iput v3, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mPositionX:I

    invoke-virtual {v0, v1}, Landroid/text/Layout;->getLineTop(I)I

    move-result v3

    iput v3, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mPositionY:I

    iget v3, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mPositionX:I

    iget-object v4, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->viewportToContentHorizontalOffset()I

    move-result v4

    add-int/2addr v3, v4

    iput v3, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mPositionX:I

    iget v3, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mPositionY:I

    iget-object v4, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->viewportToContentVerticalOffset()I

    move-result v4

    add-int/2addr v3, v4

    iput v3, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mPositionY:I

    if-eqz p2, :cond_0

    const/4 v3, 0x2

    new-array v2, v3, [I

    .local v2, location:[I
    iget-object v3, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->getLocationOnScreen([I)V

    const/4 v3, 0x0

    aget v3, v2, v3

    iget v4, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mPositionX:I

    add-int/2addr v3, v4

    iput v3, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mContainerX:I

    const/4 v3, 0x1

    aget v3, v2, v3

    iget v4, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mPositionY:I

    add-int/2addr v3, v4

    iput v3, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mContainerY:I

    .end local v2           #location:[I
    :cond_0
    return-void
.end method

.method public updateSelection(I)V
    .locals 2
    .parameter "offset"

    .prologue
    iget-object v0, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mEditor:Landroid/widget/Editor;

    iget-object v1, p0, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getSelectionStart()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Landroid/widget/Editor;->setTextSelectionWrap(II)V

    invoke-virtual {p0}, Landroid/widget/NubiaCursorController$SelectionEndHandleView;->updateDrawable()V

    return-void
.end method
