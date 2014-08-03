.class public Lnubia/ui/NubiaActionBar;
.super Ljava/lang/Object;
.source "NubiaActionBar.java"

# interfaces
.implements Lnubia/ui/IActionBar;


# instance fields
.field _actionBarView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/android/internal/widget/ActionBarView;",
            ">;"
        }
    .end annotation
.end field

.field _actionMenuItemView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/android/internal/view/menu/ActionMenuItemView;",
            ">;"
        }
    .end annotation
.end field

.field _actionMenuView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/android/internal/view/menu/ActionMenuView;",
            ">;"
        }
    .end annotation
.end field

.field _context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnubia/ui/NubiaActionBar;->_context:Landroid/content/Context;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/internal/view/menu/ActionMenuItemView;)V
    .locals 1
    .parameter "context"
    .parameter "view"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnubia/ui/NubiaActionBar;->_context:Landroid/content/Context;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lnubia/ui/NubiaActionBar;->_actionMenuItemView:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/internal/view/menu/ActionMenuView;)V
    .locals 1
    .parameter "context"
    .parameter "view"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnubia/ui/NubiaActionBar;->_context:Landroid/content/Context;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lnubia/ui/NubiaActionBar;->_actionMenuView:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/internal/widget/ActionBarView;)V
    .locals 1
    .parameter "context"
    .parameter "view"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnubia/ui/NubiaActionBar;->_context:Landroid/content/Context;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lnubia/ui/NubiaActionBar;->_actionBarView:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public computeMenuStart(IIII)I
    .locals 1
    .parameter "direction"
    .parameter "menuViewWidth"
    .parameter "menuPaddingLeft"
    .parameter "menuPaddingRight"

    .prologue
    add-int v0, p3, p4

    if-ne p2, v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    mul-int v0, p1, p2

    goto :goto_0
.end method

.method public getActionBarCustomPaddingStart()I
    .locals 2

    .prologue
    iget-object v0, p0, Lnubia/ui/NubiaActionBar;->_context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x1050090

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0
.end method

.method public getActionBarPaddingStart()I
    .locals 1

    .prologue
    const/4 v0, 0x0

    return v0
.end method

.method public getActionMenuHight()I
    .locals 2

    .prologue
    iget-object v0, p0, Lnubia/ui/NubiaActionBar;->_context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x1050083

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0
.end method

.method public getActionMenuItemViewOnMeasure(II)Z
    .locals 1
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    iget-object v0, p0, Lnubia/ui/NubiaActionBar;->_actionMenuItemView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/view/menu/ActionMenuItemView;

    invoke-virtual {v0, p1, p2}, Lcom/android/internal/view/menu/ActionMenuItemView;->nubiaUiOnMeasure(II)Z

    move-result v0

    return v0
.end method

.method public getActionMenuPresenter()Lcom/android/internal/view/menu/ActionMenuPresenter;
    .locals 4

    .prologue
    const v1, 0x1090070

    .local v1, mMenuLayout:I
    const v0, 0x109006f

    .local v0, mMenuItemLayout:I
    new-instance v2, Lcom/android/internal/view/menu/ActionMenuPresenter;

    iget-object v3, p0, Lnubia/ui/NubiaActionBar;->_context:Landroid/content/Context;

    invoke-direct {v2, v3, v1, v0}, Lcom/android/internal/view/menu/ActionMenuPresenter;-><init>(Landroid/content/Context;II)V

    return-object v2
.end method

.method public getActionMenuViewOnLayout(ZIIII)Z
    .locals 6
    .parameter "changed"
    .parameter "left"
    .parameter "top"
    .parameter "right"
    .parameter "bottom"

    .prologue
    iget-object v0, p0, Lnubia/ui/NubiaActionBar;->_actionMenuView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/view/menu/ActionMenuView;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/android/internal/view/menu/ActionMenuView;->nubiaUiOnLayout(ZIIII)Z

    move-result v0

    return v0
.end method

.method public getActionMenuViewOnMeasure(II)Z
    .locals 1
    .parameter "widthMeasureSpec"
    .parameter "heightMeasureSpec"

    .prologue
    iget-object v0, p0, Lnubia/ui/NubiaActionBar;->_actionMenuView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/view/menu/ActionMenuView;

    invoke-virtual {v0, p1, p2}, Lcom/android/internal/view/menu/ActionMenuView;->nubiaUiOnMeasure(II)Z

    move-result v0

    return v0
.end method

.method public getActionModeLayout()I
    .locals 1

    .prologue
    const v0, 0x1090071

    return v0
.end method

.method public getHomeLayoutResId(Landroid/content/res/TypedArray;)I
    .locals 2
    .parameter "temp"

    .prologue
    const/16 v0, 0xf

    const v1, 0x109006e

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    return v0
.end method

.method public getHomeViewStartOffset()I
    .locals 1

    .prologue
    iget-object v0, p0, Lnubia/ui/NubiaActionBar;->_actionBarView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/widget/ActionBarView;

    invoke-virtual {v0}, Lcom/android/internal/widget/ActionBarView;->getNubiaStartOffset()I

    move-result v0

    return v0
.end method

.method public getMaxIconSize(I)I
    .locals 2
    .parameter "maxIconSize"

    .prologue
    iget-object v0, p0, Lnubia/ui/NubiaActionBar;->_context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x1050085

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0
.end method

.method public isSetWidthLimit(Z)Z
    .locals 1
    .parameter "strict"

    .prologue
    const/4 v0, 0x0

    return v0
.end method

.method public isShowsOverflowMenuButton(Lcom/android/internal/view/ActionBarPolicy;)Z
    .locals 1
    .parameter "actionBarPolicy"

    .prologue
    invoke-virtual {p1}, Lcom/android/internal/view/ActionBarPolicy;->showsNubiaOverflowMenuButton()Z

    move-result v0

    return v0
.end method

.method public resetMaxItemHeight()Z
    .locals 1

    .prologue
    const/4 v0, 0x1

    return v0
.end method

.method public resetPositionChild()Z
    .locals 1

    .prologue
    const/4 v0, 0x1

    return v0
.end method

.method public setDropDownSpinnerWidth(Landroid/widget/Spinner;)V
    .locals 5
    .parameter "spinner"

    .prologue
    new-instance v1, Landroid/util/DisplayMetrics;

    invoke-direct {v1}, Landroid/util/DisplayMetrics;-><init>()V

    .local v1, metric:Landroid/util/DisplayMetrics;
    iget-object v3, p0, Lnubia/ui/NubiaActionBar;->_context:Landroid/content/Context;

    const-string v4, "window"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    .local v0, mWindowManager:Landroid/view/WindowManager;
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    iget v2, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    .local v2, width:I
    invoke-virtual {p1, v2}, Landroid/widget/Spinner;->setDropDownWidth(I)V

    return-void
.end method

.method public setHomeViewShowIcon(Z)V
    .locals 1
    .parameter "showIcon"

    .prologue
    iget-object v0, p0, Lnubia/ui/NubiaActionBar;->_actionBarView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/widget/ActionBarView;

    invoke-virtual {v0, p1}, Lcom/android/internal/widget/ActionBarView;->setNubiaShowIcon(Z)V

    return-void
.end method

.method public setMenuCompoundIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 4
    .parameter "icon"

    .prologue
    const/4 v3, 0x0

    iget-object v1, p0, Lnubia/ui/NubiaActionBar;->_actionMenuItemView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/view/menu/ActionMenuItemView;

    .local v0, v:Lcom/android/internal/view/menu/ActionMenuItemView;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lnubia/ui/NubiaActionBar;->_context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    invoke-virtual {v0, p1, v3, v3, v3}, Lcom/android/internal/view/menu/ActionMenuItemView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {v0, v3, p1, v3, v3}, Lcom/android/internal/view/menu/ActionMenuItemView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    const/4 v1, 0x6

    invoke-virtual {v0, v1}, Lcom/android/internal/view/menu/ActionMenuItemView;->setCompoundDrawablePadding(I)V

    goto :goto_0
.end method
