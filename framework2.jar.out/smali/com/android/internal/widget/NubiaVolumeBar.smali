.class public Lcom/android/internal/widget/NubiaVolumeBar;
.super Landroid/view/View;
.source "NubiaVolumeBar.java"


# instance fields
.field private blue:Landroid/graphics/drawable/Drawable;

.field private drawableHeight:I

.field private drawableWidth:I

.field private gray:Landroid/graphics/drawable/Drawable;

.field private max:I

.field private progress:I

.field private white:Landroid/graphics/drawable/Drawable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/android/internal/widget/NubiaVolumeBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .parameter "context"
    .parameter "attrs"

    .prologue
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/internal/widget/NubiaVolumeBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3
    .parameter "context"
    .parameter "attrs"
    .parameter "defStyle"

    .prologue
    const v2, 0x108049b

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->blue:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x108049c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->gray:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->white:Landroid/graphics/drawable/Drawable;

    const/4 v0, 0x7

    iput v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->max:I

    const/4 v0, 0x3

    iput v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->progress:I

    iget-object v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->blue:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v0

    iput v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->drawableWidth:I

    iget v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->drawableWidth:I

    iget-object v1, p0, Lcom/android/internal/widget/NubiaVolumeBar;->gray:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->drawableWidth:I

    iget v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->drawableWidth:I

    iget-object v1, p0, Lcom/android/internal/widget/NubiaVolumeBar;->white:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->drawableWidth:I

    iget-object v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->blue:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    iput v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->drawableHeight:I

    iget v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->drawableHeight:I

    iget-object v1, p0, Lcom/android/internal/widget/NubiaVolumeBar;->gray:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->drawableHeight:I

    iget v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->drawableHeight:I

    iget-object v1, p0, Lcom/android/internal/widget/NubiaVolumeBar;->white:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->drawableHeight:I

    return-void
.end method


# virtual methods
.method public getMax()I
    .locals 1

    .prologue
    iget v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->max:I

    return v0
.end method

.method public getPregress()I
    .locals 1

    .prologue
    iget v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->progress:I

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 8
    .parameter "canvas"

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget v2, p0, Lcom/android/internal/widget/NubiaVolumeBar;->max:I

    if-gez v2, :cond_0

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0}, Lcom/android/internal/widget/NubiaVolumeBar;->getWidth()I

    move-result v2

    iget v3, p0, Lcom/android/internal/widget/NubiaVolumeBar;->max:I

    div-int/2addr v2, v3

    int-to-double v2, v2

    const-wide/high16 v4, 0x3fe0

    add-double/2addr v2, v4

    double-to-int v1, v2

    .local v1, width:I
    iget v2, p0, Lcom/android/internal/widget/NubiaVolumeBar;->drawableWidth:I

    sub-int v2, v1, v2

    div-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    invoke-virtual {p1, v2, v7}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v2, p0, Lcom/android/internal/widget/NubiaVolumeBar;->blue:Landroid/graphics/drawable/Drawable;

    iget v3, p0, Lcom/android/internal/widget/NubiaVolumeBar;->drawableWidth:I

    iget v4, p0, Lcom/android/internal/widget/NubiaVolumeBar;->drawableHeight:I

    invoke-virtual {v2, v6, v6, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v2, p0, Lcom/android/internal/widget/NubiaVolumeBar;->gray:Landroid/graphics/drawable/Drawable;

    iget v3, p0, Lcom/android/internal/widget/NubiaVolumeBar;->drawableWidth:I

    iget v4, p0, Lcom/android/internal/widget/NubiaVolumeBar;->drawableHeight:I

    invoke-virtual {v2, v6, v6, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v2, p0, Lcom/android/internal/widget/NubiaVolumeBar;->white:Landroid/graphics/drawable/Drawable;

    iget v3, p0, Lcom/android/internal/widget/NubiaVolumeBar;->drawableWidth:I

    iget v4, p0, Lcom/android/internal/widget/NubiaVolumeBar;->drawableHeight:I

    invoke-virtual {v2, v6, v6, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget v2, p0, Lcom/android/internal/widget/NubiaVolumeBar;->progress:I

    if-gtz v2, :cond_1

    iget-object v2, p0, Lcom/android/internal/widget/NubiaVolumeBar;->gray:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :goto_1
    const/4 v0, 0x2

    .local v0, i:I
    :goto_2
    iget v2, p0, Lcom/android/internal/widget/NubiaVolumeBar;->max:I

    if-gt v0, v2, :cond_5

    int-to-float v2, v1

    invoke-virtual {p1, v2, v7}, Landroid/graphics/Canvas;->translate(FF)V

    iget v2, p0, Lcom/android/internal/widget/NubiaVolumeBar;->progress:I

    if-ge v2, v0, :cond_3

    iget-object v2, p0, Lcom/android/internal/widget/NubiaVolumeBar;->gray:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :goto_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .end local v0           #i:I
    :cond_1
    iget v2, p0, Lcom/android/internal/widget/NubiaVolumeBar;->progress:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    iget-object v2, p0, Lcom/android/internal/widget/NubiaVolumeBar;->blue:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_1

    :cond_2
    iget-object v2, p0, Lcom/android/internal/widget/NubiaVolumeBar;->white:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_1

    .restart local v0       #i:I
    :cond_3
    iget v2, p0, Lcom/android/internal/widget/NubiaVolumeBar;->progress:I

    if-ne v2, v0, :cond_4

    iget-object v2, p0, Lcom/android/internal/widget/NubiaVolumeBar;->blue:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_3

    :cond_4
    iget-object v2, p0, Lcom/android/internal/widget/NubiaVolumeBar;->white:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_3

    :cond_5
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    goto :goto_0
.end method

.method protected onMeasure(II)V
    .locals 3
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    invoke-virtual {p0}, Lcom/android/internal/widget/NubiaVolumeBar;->getMeasuredWidth()I

    move-result v0

    iget v1, p0, Lcom/android/internal/widget/NubiaVolumeBar;->drawableHeight:I

    add-int/lit8 v1, v1, 0x2

    const/4 v2, 0x0

    invoke-static {v1, p2, v2}, Lcom/android/internal/widget/NubiaVolumeBar;->resolveSizeAndState(III)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/widget/NubiaVolumeBar;->setMeasuredDimension(II)V

    return-void
.end method

.method public setMax(I)V
    .locals 1
    .parameter "tMax"

    .prologue
    if-gez p1, :cond_0

    const/4 p1, 0x0

    :cond_0
    iget v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->max:I

    if-eq p1, v0, :cond_1

    iput p1, p0, Lcom/android/internal/widget/NubiaVolumeBar;->max:I

    invoke-virtual {p0}, Lcom/android/internal/widget/NubiaVolumeBar;->postInvalidate()V

    :cond_1
    return-void
.end method

.method public setProgress(I)V
    .locals 1
    .parameter "tProgress"

    .prologue
    if-gez p1, :cond_0

    const/4 p1, 0x0

    :cond_0
    iget v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->max:I

    if-le p1, v0, :cond_1

    iget p1, p0, Lcom/android/internal/widget/NubiaVolumeBar;->max:I

    :cond_1
    iget v0, p0, Lcom/android/internal/widget/NubiaVolumeBar;->progress:I

    if-eq v0, p1, :cond_2

    iput p1, p0, Lcom/android/internal/widget/NubiaVolumeBar;->progress:I

    invoke-virtual {p0}, Lcom/android/internal/widget/NubiaVolumeBar;->postInvalidate()V

    :cond_2
    return-void
.end method
