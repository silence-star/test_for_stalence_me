.class public abstract Lnubia/ui/widget/MagnifierController;
.super Ljava/lang/Object;
.source "MagnifierController.java"


# static fields
.field private static final SCALE:F = 1.4f


# instance fields
.field private mAnchorLocation:[I

.field private mClipRect:Landroid/graphics/Rect;

.field private mContainer:Landroid/widget/PopupWindow;

.field private mContext:Landroid/content/Context;

.field private mLTPoint:Landroid/graphics/Point;

.field protected mLongClickX:I

.field protected mLongClickY:I

.field private mMagnifierHeight:I

.field private mMagnifierView:Lnubia/ui/widget/MagnifierView;

.field private mMagnifierWidth:I

.field private mMoveEvent:Landroid/view/MotionEvent;

.field protected mParent:Landroid/view/View;

.field private mScaleMagnifierHeight:I

.field private mScaleMagnifierWidth:I

.field private mScreenSize:[I

.field private mShowing:Z


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 2
    .parameter "parent"

    .prologue
    const/4 v1, 0x2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array v0, v1, [I

    iput-object v0, p0, Lnubia/ui/widget/MagnifierController;->mScreenSize:[I

    new-array v0, v1, [I

    iput-object v0, p0, Lnubia/ui/widget/MagnifierController;->mAnchorLocation:[I

    iput-object p1, p0, Lnubia/ui/widget/MagnifierController;->mParent:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lnubia/ui/widget/MagnifierController;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lnubia/ui/widget/MagnifierController;->mContext:Landroid/content/Context;

    invoke-direct {p0, v0}, Lnubia/ui/widget/MagnifierController;->initPopupWindow(Landroid/content/Context;)V

    return-void
.end method

.method private hideContainer()V
    .locals 1

    .prologue
    iget-object v0, p0, Lnubia/ui/widget/MagnifierController;->mContainer:Landroid/widget/PopupWindow;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnubia/ui/widget/MagnifierController;->mContainer:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnubia/ui/widget/MagnifierController;->mContainer:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    :cond_0
    return-void
.end method

.method private initPopupWindow(Landroid/content/Context;)V
    .locals 6
    .parameter "context"

    .prologue
    const/4 v5, -0x2

    const v4, 0x3fb33333

    const/4 v3, 0x0

    new-instance v0, Landroid/widget/PopupWindow;

    const/4 v1, 0x0

    const v2, 0x10102c8

    invoke-direct {v0, p1, v1, v2}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v0, p0, Lnubia/ui/widget/MagnifierController;->mContainer:Landroid/widget/PopupWindow;

    iget-object v0, p0, Lnubia/ui/widget/MagnifierController;->mContainer:Landroid/widget/PopupWindow;

    invoke-virtual {v0, v3}, Landroid/widget/PopupWindow;->setClippingEnabled(Z)V

    iget-object v0, p0, Lnubia/ui/widget/MagnifierController;->mContainer:Landroid/widget/PopupWindow;

    const/16 v1, 0x3ea

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setWindowLayoutType(I)V

    iget-object v0, p0, Lnubia/ui/widget/MagnifierController;->mContainer:Landroid/widget/PopupWindow;

    invoke-virtual {v0, v5, v5}, Landroid/widget/PopupWindow;->setWindowLayoutMode(II)V

    iget-object v0, p0, Lnubia/ui/widget/MagnifierController;->mContainer:Landroid/widget/PopupWindow;

    const v1, 0x1030004

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    new-instance v0, Lnubia/ui/widget/MagnifierView;

    iget-object v1, p0, Lnubia/ui/widget/MagnifierController;->mParent:Landroid/view/View;

    invoke-direct {v0, v1}, Lnubia/ui/widget/MagnifierView;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lnubia/ui/widget/MagnifierController;->mMagnifierView:Lnubia/ui/widget/MagnifierView;

    iget-object v0, p0, Lnubia/ui/widget/MagnifierController;->mContainer:Landroid/widget/PopupWindow;

    iget-object v1, p0, Lnubia/ui/widget/MagnifierController;->mMagnifierView:Lnubia/ui/widget/MagnifierView;

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    iget-object v0, p0, Lnubia/ui/widget/MagnifierController;->mMagnifierView:Lnubia/ui/widget/MagnifierView;

    invoke-virtual {v0}, Lnubia/ui/widget/MagnifierView;->viewWidth()I

    move-result v0

    iput v0, p0, Lnubia/ui/widget/MagnifierController;->mMagnifierWidth:I

    iget-object v0, p0, Lnubia/ui/widget/MagnifierController;->mMagnifierView:Lnubia/ui/widget/MagnifierView;

    invoke-virtual {v0}, Lnubia/ui/widget/MagnifierView;->viewHeight()I

    move-result v0

    iput v0, p0, Lnubia/ui/widget/MagnifierController;->mMagnifierHeight:I

    iget v0, p0, Lnubia/ui/widget/MagnifierController;->mMagnifierWidth:I

    int-to-float v0, v0

    div-float/2addr v0, v4

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Lnubia/ui/widget/MagnifierController;->mScaleMagnifierWidth:I

    iget v0, p0, Lnubia/ui/widget/MagnifierController;->mMagnifierHeight:I

    int-to-float v0, v0

    div-float/2addr v0, v4

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p0, Lnubia/ui/widget/MagnifierController;->mScaleMagnifierHeight:I

    new-instance v0, Landroid/graphics/Rect;

    iget v1, p0, Lnubia/ui/widget/MagnifierController;->mScaleMagnifierWidth:I

    iget v2, p0, Lnubia/ui/widget/MagnifierController;->mScaleMagnifierHeight:I

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v0, p0, Lnubia/ui/widget/MagnifierController;->mClipRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    iput-object v0, p0, Lnubia/ui/widget/MagnifierController;->mLTPoint:Landroid/graphics/Point;

    return-void
.end method

.method public static isMagnifierEnabled(Landroid/widget/TextView;)Z
    .locals 2
    .parameter "anchor"

    .prologue
    invoke-virtual {p0}, Landroid/widget/TextView;->disallowShowMagnifier()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x0

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    .local v0, result:Z
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v1

    instance-of v1, v1, Landroid/app/Activity;

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0
.end method

.method private setVisibleScreenSize(Landroid/content/Context;)V
    .locals 6
    .parameter "context"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    sget-boolean v2, Landroid/util/PowerMoConfig;->WITHOUT_ALL:Z

    if-nez v2, :cond_1

    invoke-static {}, Landroid/content/SmartShowContext;->getInstance()Landroid/content/ISmartShowContext;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/ISmartShowContext;->getStackBounds()Landroid/graphics/Rect;

    move-result-object v0

    .local v0, bounds:Landroid/graphics/Rect;
    if-eqz v0, :cond_0

    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mScreenSize:[I

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    aput v3, v2, v4

    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mScreenSize:[I

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v3

    aput v3, v2, v5

    .end local v0           #bounds:Landroid/graphics/Rect;
    :goto_0
    return-void

    .restart local v0       #bounds:Landroid/graphics/Rect;
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .local v1, res:Landroid/content/res/Resources;
    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mScreenSize:[I

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    aput v3, v2, v4

    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mScreenSize:[I

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    aput v3, v2, v5

    goto :goto_0

    .end local v0           #bounds:Landroid/graphics/Rect;
    .end local v1           #res:Landroid/content/res/Resources;
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .restart local v1       #res:Landroid/content/res/Resources;
    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mScreenSize:[I

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    aput v3, v2, v4

    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mScreenSize:[I

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    aput v3, v2, v5

    goto :goto_0
.end method

.method private showMagnifier()V
    .locals 9

    .prologue
    const/4 v8, -0x1

    const/4 v7, 0x1

    const/4 v6, 0x0

    invoke-virtual {p0}, Lnubia/ui/widget/MagnifierController;->onPreShow()V

    iget v2, p0, Lnubia/ui/widget/MagnifierController;->mLongClickX:I

    iget-object v3, p0, Lnubia/ui/widget/MagnifierController;->mAnchorLocation:[I

    aget v3, v3, v6

    add-int v0, v2, v3

    .local v0, x:I
    iget v2, p0, Lnubia/ui/widget/MagnifierController;->mLongClickY:I

    iget-object v3, p0, Lnubia/ui/widget/MagnifierController;->mAnchorLocation:[I

    aget v3, v3, v7

    add-int v1, v2, v3

    .local v1, y:I
    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mLTPoint:Landroid/graphics/Point;

    iget v3, p0, Lnubia/ui/widget/MagnifierController;->mMagnifierWidth:I

    div-int/lit8 v3, v3, 0x2

    sub-int v3, v0, v3

    iget v4, p0, Lnubia/ui/widget/MagnifierController;->mMagnifierHeight:I

    sub-int v4, v1, v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Point;->set(II)V

    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mLTPoint:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    if-gez v2, :cond_2

    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mLTPoint:Landroid/graphics/Point;

    iget-object v3, p0, Lnubia/ui/widget/MagnifierController;->mLTPoint:Landroid/graphics/Point;

    iget v3, v3, Landroid/graphics/Point;->x:I

    neg-int v3, v3

    invoke-virtual {v2, v3, v6}, Landroid/graphics/Point;->offset(II)V

    :cond_0
    :goto_0
    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mLTPoint:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->y:I

    if-gez v2, :cond_3

    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mLTPoint:Landroid/graphics/Point;

    iget-object v3, p0, Lnubia/ui/widget/MagnifierController;->mLTPoint:Landroid/graphics/Point;

    iget v3, v3, Landroid/graphics/Point;->y:I

    neg-int v3, v3

    invoke-virtual {v2, v6, v3}, Landroid/graphics/Point;->offset(II)V

    :cond_1
    :goto_1
    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mContainer:Landroid/widget/PopupWindow;

    invoke-virtual {v2}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mContainer:Landroid/widget/PopupWindow;

    iget-object v3, p0, Lnubia/ui/widget/MagnifierController;->mLTPoint:Landroid/graphics/Point;

    iget v3, v3, Landroid/graphics/Point;->x:I

    iget-object v4, p0, Lnubia/ui/widget/MagnifierController;->mLTPoint:Landroid/graphics/Point;

    iget v4, v4, Landroid/graphics/Point;->y:I

    invoke-virtual {v2, v3, v4, v8, v8}, Landroid/widget/PopupWindow;->update(IIII)V

    :goto_2
    return-void

    :cond_2
    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mLTPoint:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    iget v3, p0, Lnubia/ui/widget/MagnifierController;->mMagnifierWidth:I

    add-int/2addr v2, v3

    iget-object v3, p0, Lnubia/ui/widget/MagnifierController;->mScreenSize:[I

    aget v3, v3, v6

    if-le v2, v3, :cond_0

    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mLTPoint:Landroid/graphics/Point;

    iget-object v3, p0, Lnubia/ui/widget/MagnifierController;->mScreenSize:[I

    aget v3, v3, v6

    iget-object v4, p0, Lnubia/ui/widget/MagnifierController;->mLTPoint:Landroid/graphics/Point;

    iget v4, v4, Landroid/graphics/Point;->x:I

    iget v5, p0, Lnubia/ui/widget/MagnifierController;->mMagnifierWidth:I

    add-int/2addr v4, v5

    sub-int/2addr v3, v4

    invoke-virtual {v2, v3, v6}, Landroid/graphics/Point;->offset(II)V

    goto :goto_0

    :cond_3
    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mLTPoint:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->y:I

    iget v3, p0, Lnubia/ui/widget/MagnifierController;->mMagnifierHeight:I

    add-int/2addr v2, v3

    iget-object v3, p0, Lnubia/ui/widget/MagnifierController;->mScreenSize:[I

    aget v3, v3, v7

    if-le v2, v3, :cond_1

    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mLTPoint:Landroid/graphics/Point;

    iget-object v3, p0, Lnubia/ui/widget/MagnifierController;->mScreenSize:[I

    aget v3, v3, v7

    iget-object v4, p0, Lnubia/ui/widget/MagnifierController;->mLTPoint:Landroid/graphics/Point;

    iget v4, v4, Landroid/graphics/Point;->y:I

    iget v5, p0, Lnubia/ui/widget/MagnifierController;->mMagnifierHeight:I

    add-int/2addr v4, v5

    sub-int/2addr v3, v4

    invoke-virtual {v2, v6, v3}, Landroid/graphics/Point;->offset(II)V

    goto :goto_1

    :cond_4
    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mContainer:Landroid/widget/PopupWindow;

    iget-object v3, p0, Lnubia/ui/widget/MagnifierController;->mParent:Landroid/view/View;

    iget-object v4, p0, Lnubia/ui/widget/MagnifierController;->mLTPoint:Landroid/graphics/Point;

    iget v4, v4, Landroid/graphics/Point;->x:I

    iget-object v5, p0, Lnubia/ui/widget/MagnifierController;->mLTPoint:Landroid/graphics/Point;

    iget v5, v5, Landroid/graphics/Point;->y:I

    invoke-virtual {v2, v3, v6, v4, v5}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    goto :goto_2
.end method

.method private updatePosition(Z)V
    .locals 7
    .parameter "isShow"

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mMoveEvent:Landroid/view/MotionEvent;

    invoke-virtual {p0, v2}, Lnubia/ui/widget/MagnifierController;->onUpdatePosition(Landroid/view/MotionEvent;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget v2, p0, Lnubia/ui/widget/MagnifierController;->mLongClickX:I

    iget-object v3, p0, Lnubia/ui/widget/MagnifierController;->mAnchorLocation:[I

    aget v3, v3, v5

    add-int v0, v2, v3

    .local v0, x:I
    iget v2, p0, Lnubia/ui/widget/MagnifierController;->mLongClickY:I

    iget-object v3, p0, Lnubia/ui/widget/MagnifierController;->mAnchorLocation:[I

    aget v3, v3, v6

    add-int v1, v2, v3

    .local v1, y:I
    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mClipRect:Landroid/graphics/Rect;

    iget v3, p0, Lnubia/ui/widget/MagnifierController;->mScaleMagnifierWidth:I

    div-int/lit8 v3, v3, 0x2

    sub-int v3, v0, v3

    iget v4, p0, Lnubia/ui/widget/MagnifierController;->mScaleMagnifierHeight:I

    div-int/lit8 v4, v4, 0x2

    sub-int v4, v1, v4

    invoke-virtual {v2, v3, v4}, Landroid/graphics/Rect;->offsetTo(II)V

    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mClipRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    if-gez v2, :cond_4

    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mClipRect:Landroid/graphics/Rect;

    iget-object v3, p0, Lnubia/ui/widget/MagnifierController;->mClipRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->left:I

    neg-int v3, v3

    invoke-virtual {v2, v3, v5}, Landroid/graphics/Rect;->offset(II)V

    :cond_0
    :goto_0
    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mClipRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    if-gez v2, :cond_5

    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mClipRect:Landroid/graphics/Rect;

    iget-object v3, p0, Lnubia/ui/widget/MagnifierController;->mClipRect:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    neg-int v3, v3

    invoke-virtual {v2, v5, v3}, Landroid/graphics/Rect;->offset(II)V

    :cond_1
    :goto_1
    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mMagnifierView:Lnubia/ui/widget/MagnifierView;

    invoke-virtual {v2}, Lnubia/ui/widget/MagnifierView;->notifyUpdateDrawingCache()V

    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mMagnifierView:Lnubia/ui/widget/MagnifierView;

    iget-object v3, p0, Lnubia/ui/widget/MagnifierController;->mClipRect:Landroid/graphics/Rect;

    invoke-virtual {v2, v3}, Lnubia/ui/widget/MagnifierView;->setShowRect(Landroid/graphics/Rect;)V

    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mMagnifierView:Lnubia/ui/widget/MagnifierView;

    invoke-virtual {v2}, Lnubia/ui/widget/MagnifierView;->invalidate()V

    .end local v0           #x:I
    .end local v1           #y:I
    :cond_2
    if-nez p1, :cond_3

    invoke-direct {p0}, Lnubia/ui/widget/MagnifierController;->showMagnifier()V

    :cond_3
    return-void

    .restart local v0       #x:I
    .restart local v1       #y:I
    :cond_4
    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mClipRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->right:I

    iget-object v3, p0, Lnubia/ui/widget/MagnifierController;->mScreenSize:[I

    aget v3, v3, v5

    if-le v2, v3, :cond_0

    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mClipRect:Landroid/graphics/Rect;

    iget-object v3, p0, Lnubia/ui/widget/MagnifierController;->mScreenSize:[I

    aget v3, v3, v5

    iget-object v4, p0, Lnubia/ui/widget/MagnifierController;->mClipRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    sub-int/2addr v3, v4

    invoke-virtual {v2, v3, v5}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_0

    :cond_5
    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mClipRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    iget-object v3, p0, Lnubia/ui/widget/MagnifierController;->mScreenSize:[I

    aget v3, v3, v6

    if-le v2, v3, :cond_1

    iget-object v2, p0, Lnubia/ui/widget/MagnifierController;->mClipRect:Landroid/graphics/Rect;

    iget-object v3, p0, Lnubia/ui/widget/MagnifierController;->mScreenSize:[I

    aget v3, v3, v6

    iget-object v4, p0, Lnubia/ui/widget/MagnifierController;->mClipRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v3, v4

    invoke-virtual {v2, v5, v3}, Landroid/graphics/Rect;->offset(II)V

    goto :goto_1
.end method


# virtual methods
.method public hide()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    iput-boolean v1, p0, Lnubia/ui/widget/MagnifierController;->mShowing:Z

    iget-object v0, p0, Lnubia/ui/widget/MagnifierController;->mParent:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnubia/ui/widget/MagnifierController;->mParent:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-interface {v0, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lnubia/ui/widget/MagnifierController;->mMoveEvent:Landroid/view/MotionEvent;

    invoke-direct {p0}, Lnubia/ui/widget/MagnifierController;->hideContainer()V

    iget-object v0, p0, Lnubia/ui/widget/MagnifierController;->mMagnifierView:Lnubia/ui/widget/MagnifierView;

    invoke-virtual {v0}, Lnubia/ui/widget/MagnifierView;->onHide()V

    invoke-virtual {p0}, Lnubia/ui/widget/MagnifierController;->onPostHide()V

    return-void
.end method

.method public isShowing()Z
    .locals 1

    .prologue
    iget-boolean v0, p0, Lnubia/ui/widget/MagnifierController;->mShowing:Z

    return v0
.end method

.method public abstract onHandleController(Landroid/view/MotionEvent;)V
.end method

.method public onParentChanged()V
    .locals 1

    .prologue
    iget-boolean v0, p0, Lnubia/ui/widget/MagnifierController;->mShowing:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lnubia/ui/widget/MagnifierController;->showMagnifier()V

    :cond_0
    return-void
.end method

.method public abstract onPostHide()V
.end method

.method public abstract onPreShow()V
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2
    .parameter "event"

    .prologue
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, p0, Lnubia/ui/widget/MagnifierController;->mLongClickX:I

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, p0, Lnubia/ui/widget/MagnifierController;->mLongClickY:I

    iput-object p1, p0, Lnubia/ui/widget/MagnifierController;->mMoveEvent:Landroid/view/MotionEvent;

    const/4 v0, 0x0

    .local v0, result:Z
    invoke-virtual {p0}, Lnubia/ui/widget/MagnifierController;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    :goto_0
    invoke-virtual {p0, p1}, Lnubia/ui/widget/MagnifierController;->onHandleController(Landroid/view/MotionEvent;)V

    :cond_0
    return v0

    :pswitch_0
    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lnubia/ui/widget/MagnifierController;->updatePosition(Z)V

    const/4 v0, 0x1

    goto :goto_0

    :pswitch_1
    invoke-virtual {p0}, Lnubia/ui/widget/MagnifierController;->hide()V

    goto :goto_0

    :pswitch_2
    invoke-virtual {p0}, Lnubia/ui/widget/MagnifierController;->hide()V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public abstract onUpdatePosition(Landroid/view/MotionEvent;)Z
.end method

.method public show()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    iput-boolean v2, p0, Lnubia/ui/widget/MagnifierController;->mShowing:Z

    iget-object v0, p0, Lnubia/ui/widget/MagnifierController;->mParent:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnubia/ui/widget/MagnifierController;->mParent:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-interface {v0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_0
    iget-object v0, p0, Lnubia/ui/widget/MagnifierController;->mContext:Landroid/content/Context;

    invoke-direct {p0, v0}, Lnubia/ui/widget/MagnifierController;->setVisibleScreenSize(Landroid/content/Context;)V

    iget-object v0, p0, Lnubia/ui/widget/MagnifierController;->mParent:Landroid/view/View;

    iget-object v1, p0, Lnubia/ui/widget/MagnifierController;->mAnchorLocation:[I

    invoke-virtual {v0, v1}, Landroid/view/View;->getLocationInWindow([I)V

    invoke-direct {p0, v2}, Lnubia/ui/widget/MagnifierController;->updatePosition(Z)V

    invoke-direct {p0}, Lnubia/ui/widget/MagnifierController;->showMagnifier()V

    return-void
.end method
