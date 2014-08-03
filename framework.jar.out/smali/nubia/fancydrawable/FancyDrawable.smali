.class public abstract Lnubia/fancydrawable/FancyDrawable;
.super Landroid/graphics/drawable/Drawable;
.source "FancyDrawable.java"

# interfaces
.implements Lnubia/fancydrawable/FancyDrawableListener;


# instance fields
.field protected mAvailableHeight:I

.field protected mAvailableWidth:I

.field protected mHandler:Landroid/os/Handler;

.field protected mID:Ljava/lang/String;

.field protected mIntrinsicHeight:I

.field protected mIntrinsicWidth:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    iput v0, p0, Lnubia/fancydrawable/FancyDrawable;->mAvailableWidth:I

    iput v0, p0, Lnubia/fancydrawable/FancyDrawable;->mAvailableHeight:I

    const/4 v0, 0x0

    iput-object v0, p0, Lnubia/fancydrawable/FancyDrawable;->mHandler:Landroid/os/Handler;

    const-string v0, ""

    iput-object v0, p0, Lnubia/fancydrawable/FancyDrawable;->mID:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 0
    .parameter "arg0"

    .prologue
    return-void
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .prologue
    iget-object v0, p0, Lnubia/fancydrawable/FancyDrawable;->mID:Ljava/lang/String;

    return-object v0
.end method

.method public getIntrinsicHeight()I
    .locals 1

    .prologue
    iget v0, p0, Lnubia/fancydrawable/FancyDrawable;->mIntrinsicHeight:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    .prologue
    iget v0, p0, Lnubia/fancydrawable/FancyDrawable;->mIntrinsicWidth:I

    return v0
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    const/4 v0, 0x0

    return v0
.end method

.method public setAlpha(I)V
    .locals 0
    .parameter "arg0"

    .prologue
    return-void
.end method

.method public setBounds(IIII)V
    .locals 1
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    invoke-super {p0, p1, p2, p3, p4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    sub-int v0, p3, p1

    iput v0, p0, Lnubia/fancydrawable/FancyDrawable;->mAvailableWidth:I

    sub-int v0, p4, p2

    iput v0, p0, Lnubia/fancydrawable/FancyDrawable;->mAvailableHeight:I

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0
    .parameter "arg0"

    .prologue
    return-void
.end method

.method public setHandler(Landroid/os/Handler;)V
    .locals 0
    .parameter "handler"

    .prologue
    iput-object p1, p0, Lnubia/fancydrawable/FancyDrawable;->mHandler:Landroid/os/Handler;

    invoke-virtual {p0}, Lnubia/fancydrawable/FancyDrawable;->startToRun()V

    return-void
.end method

.method public setHeight(I)V
    .locals 0
    .parameter "height"

    .prologue
    iput p1, p0, Lnubia/fancydrawable/FancyDrawable;->mAvailableHeight:I

    return-void
.end method

.method public setIntrinsicSize(II)V
    .locals 0
    .parameter "width"
    .parameter "height"

    .prologue
    iput p1, p0, Lnubia/fancydrawable/FancyDrawable;->mIntrinsicWidth:I

    iput p2, p0, Lnubia/fancydrawable/FancyDrawable;->mIntrinsicHeight:I

    return-void
.end method

.method public setWidth(I)V
    .locals 0
    .parameter "width"

    .prologue
    iput p1, p0, Lnubia/fancydrawable/FancyDrawable;->mAvailableWidth:I

    return-void
.end method

.method public startToRun()V
    .locals 0

    .prologue
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    const-string v0, "nubia.fancydrawable.FancyDrawable"

    return-object v0
.end method
