.class public Lnubia/ui/widget/ListPopupWindowBuilder;
.super Ljava/lang/Object;
.source "ListPopupWindowBuilder.java"


# static fields
.field private static final ID_BEZIER_VIEW_BOTTOM:I = 0x15

.field private static final ID_BEZIER_VIEW_TOP:I = 0x14

.field public static final ID_CONTENT_CONTAINER:I = 0xa

.field public static final ID_DROPDOWN_VIEW:I = 0xb


# instance fields
.field private mBean:Lnubia/ui/widget/PopupWindowInfo;

.field private mBezierViewBottom:Lnubia/ui/widget/BezierView;

.field private mBezierViewParams:Landroid/widget/LinearLayout$LayoutParams;

.field private mBezierViewTop:Lnubia/ui/widget/BezierView;

.field private mContentContainer:Landroid/widget/LinearLayout;

.field private mContentParams:Landroid/widget/LinearLayout$LayoutParams;

.field private mContext:Landroid/content/Context;

.field private mDividerParam:Landroid/view/ViewGroup$LayoutParams;

.field private mDropDownViewParams:Landroid/widget/LinearLayout$LayoutParams;

.field private mLastDivider:Landroid/view/View;

.field private mLastIsOnTop:Z

.field private mLinearBezierContainer:Landroid/widget/LinearLayout;

.field private mNubiaPWAnimation:Lnubia/ui/widget/ListPopupWindowAnimation;

.field private mShowBezierView:Lnubia/ui/widget/BezierView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .parameter "context"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mLastIsOnTop:Z

    iput-object p1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mContext:Landroid/content/Context;

    return-void
.end method

.method private getMaxAvailableHeight(Landroid/view/View;IZLandroid/widget/PopupWindow;)I
    .locals 11
    .parameter "anchor"
    .parameter "yOffset"
    .parameter "ignoreBottomDecorations"
    .parameter "popup"

    .prologue
    const/4 v10, 0x1

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .local v2, displayFrame:Landroid/graphics/Rect;
    invoke-virtual {p1, v2}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    const/4 v8, 0x2

    new-array v0, v8, [I

    .local v0, anchorPos:[I
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    iget v1, v2, Landroid/graphics/Rect;->bottom:I

    .local v1, bottomEdge:I
    if-eqz p3, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    .local v5, res:Landroid/content/res/Resources;
    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v1, v8, Landroid/util/DisplayMetrics;->heightPixels:I

    .end local v5           #res:Landroid/content/res/Resources;
    :cond_0
    aget v8, v0, v10

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v9

    add-int/2addr v8, v9

    sub-int v8, v1, v8

    sub-int v3, v8, p2

    .local v3, distanceToBottom:I
    aget v8, v0, v10

    iget v9, v2, Landroid/graphics/Rect;->top:I

    sub-int/2addr v8, v9

    add-int v4, v8, p2

    .local v4, distanchToTop:I
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v6

    .local v6, returnedHeight:I
    invoke-virtual {p4}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    if-eqz v8, :cond_1

    new-instance v7, Landroid/graphics/Rect;

    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    .local v7, tempRect:Landroid/graphics/Rect;
    invoke-virtual {p4}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v8

    invoke-virtual {v8, v7}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    iget v8, v7, Landroid/graphics/Rect;->top:I

    iget v9, v7, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v8, v9

    sub-int/2addr v6, v8

    .end local v7           #tempRect:Landroid/graphics/Rect;
    :cond_1
    return v6
.end method

.method private initBezierContainer(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/widget/PopupWindow;)V
    .locals 5
    .parameter "context"
    .parameter "dropDownView"
    .parameter "popup"

    .prologue
    const/4 v3, 0x1

    const/4 v4, -0x1

    iget-object v2, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mLinearBezierContainer:Landroid/widget/LinearLayout;

    if-eqz v2, :cond_0

    :goto_0
    return-void

    :cond_0
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .local v0, bezierContainer:Landroid/widget/LinearLayout;
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v2, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const v2, 0x1080738

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setBackgroundResource(I)V

    iput-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mLinearBezierContainer:Landroid/widget/LinearLayout;

    new-instance v2, Lnubia/ui/widget/ListPopupWindowBuilder$1;

    invoke-direct {v2, p0, p3}, Lnubia/ui/widget/ListPopupWindowBuilder$1;-><init>(Lnubia/ui/widget/ListPopupWindowBuilder;Landroid/widget/PopupWindow;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Landroid/widget/LinearLayout;

    invoke-direct {v1, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .local v1, contentContainer:Landroid/widget/LinearLayout;
    invoke-virtual {v1, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x2

    invoke-direct {v2, v4, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iput-object v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mContentContainer:Landroid/widget/LinearLayout;

    new-instance v2, Lnubia/ui/widget/BezierView;

    invoke-direct {v2, p1}, Lnubia/ui/widget/BezierView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewTop:Lnubia/ui/widget/BezierView;

    new-instance v2, Lnubia/ui/widget/BezierView;

    invoke-direct {v2, p1}, Lnubia/ui/widget/BezierView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewBottom:Lnubia/ui/widget/BezierView;

    iget-object v2, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewBottom:Lnubia/ui/widget/BezierView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lnubia/ui/widget/BezierView;->setShowOnTop(Z)V

    new-instance v2, Landroid/view/View;

    invoke-direct {v2, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mLastDivider:Landroid/view/View;

    invoke-direct {p0}, Lnubia/ui/widget/ListPopupWindowBuilder;->initLayoutParams()V

    invoke-direct {p0, p2}, Lnubia/ui/widget/ListPopupWindowBuilder;->setViewId(Landroid/view/ViewGroup;)V

    goto :goto_0
.end method

.method private initLayoutParams()V
    .locals 6

    .prologue
    const/4 v4, -0x2

    const/4 v5, -0x1

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v3, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .local v3, dropDownViewParams:Landroid/widget/LinearLayout$LayoutParams;
    iput-object v3, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mDropDownViewParams:Landroid/widget/LinearLayout$LayoutParams;

    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .local v1, contentParams:Landroid/widget/LinearLayout$LayoutParams;
    iput-object v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mContentParams:Landroid/widget/LinearLayout$LayoutParams;

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v4, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewBottom:Lnubia/ui/widget/BezierView;

    invoke-virtual {v4}, Lnubia/ui/widget/BezierView;->getBezierViewHeight()I

    move-result v4

    invoke-direct {v0, v5, v4}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .local v0, bezierViewParams:Landroid/widget/LinearLayout$LayoutParams;
    iput-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewParams:Landroid/widget/LinearLayout$LayoutParams;

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v4, 0x1

    invoke-direct {v2, v5, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .local v2, dividerParam:Landroid/view/ViewGroup$LayoutParams;
    iput-object v2, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mDividerParam:Landroid/view/ViewGroup$LayoutParams;

    return-void
.end method

.method private setContentView(Landroid/content/Context;Landroid/view/ViewGroup;Z)V
    .locals 6
    .parameter "context"
    .parameter "dropDownView"
    .parameter "onTop"

    .prologue
    const/4 v5, 0x0

    iget-object v2, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mLastDivider:Landroid/view/View;

    iget-object v3, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mDividerParam:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v2, 0x1

    new-array v2, v2, [I

    const v3, 0x1010214

    aput v3, v2, v5

    invoke-virtual {p1, v2}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .local v0, a:Landroid/content/res/TypedArray;
    iget-object v2, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mLastDivider:Landroid/view/View;

    invoke-virtual {v0, v5, v5}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/view/View;->setBackgroundResource(I)V

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    iget-object v2, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mContentContainer:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewTop:Lnubia/ui/widget/BezierView;

    iget-object v4, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewParams:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mDropDownViewParams:Landroid/widget/LinearLayout$LayoutParams;

    const/4 v3, -0x1

    invoke-virtual {v2, v5, v3, v5, v5}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    iget-object v2, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mContentContainer:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mDropDownViewParams:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v2, p2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v2, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mContentContainer:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mLastDivider:Landroid/view/View;

    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    iget-object v2, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mContentContainer:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewBottom:Lnubia/ui/widget/BezierView;

    iget-object v4, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewParams:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    if-eqz p3, :cond_0

    const/16 v1, 0x50

    .local v1, gravity:I
    :goto_0
    iget-object v2, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mLinearBezierContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v2, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mLinearBezierContainer:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mContentContainer:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mContentParams:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v2, v3, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    .end local v1           #gravity:I
    :cond_0
    const/16 v1, 0x30

    goto :goto_0
.end method

.method private setViewId(Landroid/view/ViewGroup;)V
    .locals 2
    .parameter "dropDownView"

    .prologue
    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mContentContainer:Landroid/widget/LinearLayout;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setId(I)V

    const/16 v0, 0xb

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setId(I)V

    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewTop:Lnubia/ui/widget/BezierView;

    const/16 v1, 0x14

    invoke-virtual {v0, v1}, Lnubia/ui/widget/BezierView;->setId(I)V

    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewBottom:Lnubia/ui/widget/BezierView;

    const/16 v1, 0x15

    invoke-virtual {v0, v1}, Lnubia/ui/widget/BezierView;->setId(I)V

    return-void
.end method


# virtual methods
.method public createNubiaContentView(ZLandroid/view/ViewGroup;Landroid/widget/PopupWindow;)V
    .locals 3
    .parameter "isOnTop"
    .parameter "dropDownView"
    .parameter "popup"

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mContext:Landroid/content/Context;

    invoke-direct {p0, v0, p2, p3}, Lnubia/ui/widget/ListPopupWindowBuilder;->initBezierContainer(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/widget/PopupWindow;)V

    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mContext:Landroid/content/Context;

    invoke-direct {p0, v0, p2, p1}, Lnubia/ui/widget/ListPopupWindowBuilder;->setContentView(Landroid/content/Context;Landroid/view/ViewGroup;Z)V

    if-eqz p1, :cond_0

    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewTop:Lnubia/ui/widget/BezierView;

    invoke-virtual {v0, v1}, Lnubia/ui/widget/BezierView;->setVisibility(I)V

    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewBottom:Lnubia/ui/widget/BezierView;

    invoke-virtual {v0, v2}, Lnubia/ui/widget/BezierView;->setVisibility(I)V

    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mLastDivider:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewTop:Lnubia/ui/widget/BezierView;

    iput-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mShowBezierView:Lnubia/ui/widget/BezierView;

    :goto_0
    const/4 v0, -0x1

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->setBackgroundColor(I)V

    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mNubiaPWAnimation:Lnubia/ui/widget/ListPopupWindowAnimation;

    if-nez v0, :cond_1

    new-instance v0, Lnubia/ui/widget/ListPopupWindowAnimation;

    iget-object v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mContentContainer:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mShowBezierView:Lnubia/ui/widget/BezierView;

    invoke-direct {v0, v1, v2}, Lnubia/ui/widget/ListPopupWindowAnimation;-><init>(Landroid/view/View;Lnubia/ui/widget/BezierView;)V

    iput-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mNubiaPWAnimation:Lnubia/ui/widget/ListPopupWindowAnimation;

    :goto_1
    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mLinearBezierContainer:Landroid/widget/LinearLayout;

    invoke-virtual {p3, v0}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    iput-boolean p1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mLastIsOnTop:Z

    return-void

    :cond_0
    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewTop:Lnubia/ui/widget/BezierView;

    invoke-virtual {v0, v2}, Lnubia/ui/widget/BezierView;->setVisibility(I)V

    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewBottom:Lnubia/ui/widget/BezierView;

    invoke-virtual {v0, v1}, Lnubia/ui/widget/BezierView;->setVisibility(I)V

    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mLastDivider:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewBottom:Lnubia/ui/widget/BezierView;

    iput-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mShowBezierView:Lnubia/ui/widget/BezierView;

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mNubiaPWAnimation:Lnubia/ui/widget/ListPopupWindowAnimation;

    iget-object v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mContentContainer:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mShowBezierView:Lnubia/ui/widget/BezierView;

    invoke-virtual {v0, v1, v2}, Lnubia/ui/widget/ListPopupWindowAnimation;->setContentViewAndBezierView(Landroid/view/View;Lnubia/ui/widget/BezierView;)V

    goto :goto_1
.end method

.method public getAnimation()Lnubia/ui/widget/ListPopupWindowAnimation;
    .locals 1

    .prologue
    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mNubiaPWAnimation:Lnubia/ui/widget/ListPopupWindowAnimation;

    return-object v0
.end method

.method public getBezierViewHeight()I
    .locals 1

    .prologue
    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewBottom:Lnubia/ui/widget/BezierView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewBottom:Lnubia/ui/widget/BezierView;

    invoke-virtual {v0}, Lnubia/ui/widget/BezierView;->getBezierViewHeight()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getPopupWindowInfo(Landroid/view/View;IZLandroid/widget/PopupWindow;)Lnubia/ui/widget/PopupWindowInfo;
    .locals 13
    .parameter "anchor"
    .parameter "yOffset"
    .parameter "ignoreBottomDecorations"
    .parameter "popup"

    .prologue
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .local v3, displayFrame:Landroid/graphics/Rect;
    invoke-virtual {p1, v3}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    const/4 v11, 0x2

    new-array v0, v11, [I

    .local v0, anchorPos:[I
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    iget v1, v3, Landroid/graphics/Rect;->bottom:I

    .local v1, bottomEdge:I
    iget v10, v3, Landroid/graphics/Rect;->top:I

    .local v10, topEdge:I
    if-eqz p3, :cond_0

    sget-boolean v11, Landroid/util/PowerMoConfig;->WITHOUT_ALL:Z

    if-nez v11, :cond_2

    invoke-static {}, Landroid/content/SmartShowContext;->getInstance()Landroid/content/ISmartShowContext;

    move-result-object v11

    invoke-interface {v11}, Landroid/content/ISmartShowContext;->getStackBounds()Landroid/graphics/Rect;

    move-result-object v2

    .local v2, bounds:Landroid/graphics/Rect;
    if-eqz v2, :cond_0

    iget v1, v2, Landroid/graphics/Rect;->bottom:I

    iget v10, v2, Landroid/graphics/Rect;->top:I

    .end local v2           #bounds:Landroid/graphics/Rect;
    :cond_0
    :goto_0
    const/4 v11, 0x1

    aget v11, v0, v11

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v12

    add-int/2addr v11, v12

    sub-int v11, v1, v11

    sub-int v4, v11, p2

    .local v4, distanceToBottom:I
    const/4 v11, 0x1

    aget v11, v0, v11

    sub-int/2addr v11, v10

    add-int v5, v11, p2

    .local v5, distanchToTop:I
    if-le v5, v4, :cond_3

    const/4 v6, 0x1

    .local v6, onTop:Z
    :goto_1
    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v8

    .local v8, returnedHeight:I
    invoke-virtual/range {p4 .. p4}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v11

    if-eqz v11, :cond_1

    new-instance v9, Landroid/graphics/Rect;

    invoke-direct {v9}, Landroid/graphics/Rect;-><init>()V

    .local v9, tempRect:Landroid/graphics/Rect;
    invoke-virtual/range {p4 .. p4}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v11

    invoke-virtual {v11, v9}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    iget v11, v9, Landroid/graphics/Rect;->top:I

    iget v12, v9, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v11, v12

    sub-int/2addr v8, v11

    .end local v9           #tempRect:Landroid/graphics/Rect;
    :cond_1
    iget-object v11, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBean:Lnubia/ui/widget/PopupWindowInfo;

    if-nez v11, :cond_4

    new-instance v11, Lnubia/ui/widget/PopupWindowInfo;

    invoke-direct {v11, v6, v8}, Lnubia/ui/widget/PopupWindowInfo;-><init>(ZI)V

    iput-object v11, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBean:Lnubia/ui/widget/PopupWindowInfo;

    :goto_2
    iget-object v11, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBean:Lnubia/ui/widget/PopupWindowInfo;

    return-object v11

    .end local v4           #distanceToBottom:I
    .end local v5           #distanchToTop:I
    .end local v6           #onTop:Z
    .end local v8           #returnedHeight:I
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    .local v7, res:Landroid/content/res/Resources;
    invoke-virtual {v7}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v11

    iget v1, v11, Landroid/util/DisplayMetrics;->heightPixels:I

    goto :goto_0

    .end local v7           #res:Landroid/content/res/Resources;
    .restart local v4       #distanceToBottom:I
    .restart local v5       #distanchToTop:I
    :cond_3
    const/4 v6, 0x0

    goto :goto_1

    .restart local v6       #onTop:Z
    .restart local v8       #returnedHeight:I
    :cond_4
    iget-object v11, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBean:Lnubia/ui/widget/PopupWindowInfo;

    invoke-virtual {v11, v6, v8}, Lnubia/ui/widget/PopupWindowInfo;->setBeanParams(ZI)V

    goto :goto_2
.end method

.method public invalidateBezierView()V
    .locals 1

    .prologue
    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mShowBezierView:Lnubia/ui/widget/BezierView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mShowBezierView:Lnubia/ui/widget/BezierView;

    invoke-virtual {v0}, Lnubia/ui/widget/BezierView;->invalidate()V

    :cond_0
    return-void
.end method

.method public isRunning()Z
    .locals 1

    .prologue
    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mNubiaPWAnimation:Lnubia/ui/widget/ListPopupWindowAnimation;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mNubiaPWAnimation:Lnubia/ui/widget/ListPopupWindowAnimation;

    invoke-virtual {v0}, Lnubia/ui/widget/ListPopupWindowAnimation;->isRunning()Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public stopAnimation()V
    .locals 1

    .prologue
    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mNubiaPWAnimation:Lnubia/ui/widget/ListPopupWindowAnimation;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mNubiaPWAnimation:Lnubia/ui/widget/ListPopupWindowAnimation;

    invoke-virtual {v0}, Lnubia/ui/widget/ListPopupWindowAnimation;->stopAnimation()V

    :cond_0
    return-void
.end method

.method public updateNubiaContentView(Z)V
    .locals 4
    .parameter "onTop"

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    iget-boolean v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mLastIsOnTop:Z

    if-ne p1, v1, :cond_0

    :goto_0
    return-void

    :cond_0
    iput-boolean p1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mLastIsOnTop:Z

    if-eqz p1, :cond_1

    iget-object v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewTop:Lnubia/ui/widget/BezierView;

    invoke-virtual {v1, v2}, Lnubia/ui/widget/BezierView;->setVisibility(I)V

    iget-object v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewBottom:Lnubia/ui/widget/BezierView;

    invoke-virtual {v1, v3}, Lnubia/ui/widget/BezierView;->setVisibility(I)V

    iget-object v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mLastDivider:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewTop:Lnubia/ui/widget/BezierView;

    iput-object v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mShowBezierView:Lnubia/ui/widget/BezierView;

    :goto_1
    if-eqz p1, :cond_2

    const/16 v0, 0x50

    .local v0, gravity:I
    :goto_2
    iget-object v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mLinearBezierContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setGravity(I)V

    iget-object v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mLinearBezierContainer:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->removeAllViews()V

    iget-object v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mLinearBezierContainer:Landroid/widget/LinearLayout;

    iget-object v2, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mContentContainer:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mContentParams:Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v1, v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mNubiaPWAnimation:Lnubia/ui/widget/ListPopupWindowAnimation;

    if-nez v1, :cond_3

    new-instance v1, Lnubia/ui/widget/ListPopupWindowAnimation;

    iget-object v2, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mContentContainer:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mShowBezierView:Lnubia/ui/widget/BezierView;

    invoke-direct {v1, v2, v3}, Lnubia/ui/widget/ListPopupWindowAnimation;-><init>(Landroid/view/View;Lnubia/ui/widget/BezierView;)V

    iput-object v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mNubiaPWAnimation:Lnubia/ui/widget/ListPopupWindowAnimation;

    goto :goto_0

    .end local v0           #gravity:I
    :cond_1
    iget-object v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewTop:Lnubia/ui/widget/BezierView;

    invoke-virtual {v1, v3}, Lnubia/ui/widget/BezierView;->setVisibility(I)V

    iget-object v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewBottom:Lnubia/ui/widget/BezierView;

    invoke-virtual {v1, v2}, Lnubia/ui/widget/BezierView;->setVisibility(I)V

    iget-object v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mLastDivider:Landroid/view/View;

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mBezierViewBottom:Lnubia/ui/widget/BezierView;

    iput-object v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mShowBezierView:Lnubia/ui/widget/BezierView;

    goto :goto_1

    :cond_2
    const/16 v0, 0x30

    goto :goto_2

    .restart local v0       #gravity:I
    :cond_3
    iget-object v1, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mNubiaPWAnimation:Lnubia/ui/widget/ListPopupWindowAnimation;

    iget-object v2, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mContentContainer:Landroid/widget/LinearLayout;

    iget-object v3, p0, Lnubia/ui/widget/ListPopupWindowBuilder;->mShowBezierView:Lnubia/ui/widget/BezierView;

    invoke-virtual {v1, v2, v3}, Lnubia/ui/widget/ListPopupWindowAnimation;->setContentViewAndBezierView(Landroid/view/View;Lnubia/ui/widget/BezierView;)V

    goto :goto_0
.end method
