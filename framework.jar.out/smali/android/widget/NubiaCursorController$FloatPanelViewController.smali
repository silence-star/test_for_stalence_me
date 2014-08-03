.class Landroid/widget/NubiaCursorController$FloatPanelViewController;
.super Ljava/lang/Object;
.source "NubiaCursorController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/widget/NubiaCursorController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FloatPanelViewController"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private mContainer:Landroid/widget/PopupWindow;

.field private mContent:Landroid/widget/FloatPanelView;

.field private mController:Landroid/widget/NubiaCursorController;

.field private mDisplay:Landroid/view/Display;

.field private mPos:[I

.field private mStatusBarHeight:I

.field final synthetic this$0:Landroid/widget/NubiaCursorController;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const-class v0, Landroid/widget/NubiaCursorController;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Landroid/widget/NubiaCursorController;Landroid/widget/NubiaCursorController;I)V
    .locals 6
    .parameter
    .parameter "controller"
    .parameter "layoutId"

    .prologue
    const/4 v5, 0x0

    const/4 v4, -0x2

    iput-object p1, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->this$0:Landroid/widget/NubiaCursorController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v1, 0x2

    new-array v1, v1, [I

    iput-object v1, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mPos:[I

    iput-object p2, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mController:Landroid/widget/NubiaCursorController;

    new-instance v1, Landroid/widget/PopupWindow;

    iget-object v2, p1, Landroid/widget/NubiaCursorController;->mContext:Landroid/content/Context;

    const v3, 0x10102c8

    invoke-direct {v1, v2, v5, v3}, Landroid/widget/PopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iput-object v1, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mContainer:Landroid/widget/PopupWindow;

    iget-object v1, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mContainer:Landroid/widget/PopupWindow;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setSplitTouchEnabled(Z)V

    iget-object v1, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mContainer:Landroid/widget/PopupWindow;

    const/16 v2, 0x3ea

    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setWindowLayoutType(I)V

    iget-object v1, p1, Landroid/widget/NubiaCursorController;->mContext:Landroid/content/Context;

    const-string v2, "layout_inflater"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    .local v0, inflater:Landroid/view/LayoutInflater;
    invoke-virtual {v0, p3, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FloatPanelView;

    iput-object v1, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mContent:Landroid/widget/FloatPanelView;

    iget-object v1, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mContainer:Landroid/widget/PopupWindow;

    invoke-virtual {v1, v4, v4}, Landroid/widget/PopupWindow;->setWindowLayoutMode(II)V

    iget-object v1, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mContainer:Landroid/widget/PopupWindow;

    iget-object v2, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mContent:Landroid/widget/FloatPanelView;

    invoke-virtual {v1, v2}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    iget-object v1, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mContent:Landroid/widget/FloatPanelView;

    invoke-virtual {v1}, Landroid/widget/FloatPanelView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    new-instance v2, Landroid/widget/NubiaCursorController$FloatPanelViewController$1;

    invoke-direct {v2, p0, p1}, Landroid/widget/NubiaCursorController$FloatPanelViewController$1;-><init>(Landroid/widget/NubiaCursorController$FloatPanelViewController;Landroid/widget/NubiaCursorController;)V

    invoke-virtual {v1, v2}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    iget-object v1, p1, Landroid/widget/NubiaCursorController;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x105000c

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iput v1, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mStatusBarHeight:I

    iget-object v1, p1, Landroid/widget/NubiaCursorController;->mContext:Landroid/content/Context;

    const-string v2, "window"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/WindowManager;

    invoke-interface {v1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v1

    iput-object v1, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mDisplay:Landroid/view/Display;

    return-void
.end method

.method static synthetic access$000(Landroid/widget/NubiaCursorController$FloatPanelViewController;)V
    .locals 0
    .parameter "x0"

    .prologue
    invoke-direct {p0}, Landroid/widget/NubiaCursorController$FloatPanelViewController;->updatePosition()V

    return-void
.end method

.method private updatePosition()V
    .locals 12

    .prologue
    const/4 v11, -0x1

    iget-object v9, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mController:Landroid/widget/NubiaCursorController;

    iget-object v10, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mPos:[I

    invoke-virtual {v9, v10}, Landroid/widget/NubiaCursorController;->computePanelPosition([I)V

    iget-object v9, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mContent:Landroid/widget/FloatPanelView;

    invoke-virtual {v9}, Landroid/widget/FloatPanelView;->getWidth()I

    move-result v1

    .local v1, contentWidth:I
    iget-object v9, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mContent:Landroid/widget/FloatPanelView;

    invoke-virtual {v9}, Landroid/widget/FloatPanelView;->getHeight()I

    move-result v0

    .local v0, contentHeight:I
    iget-object v9, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->this$0:Landroid/widget/NubiaCursorController;

    iget-object v9, v9, Landroid/widget/NubiaCursorController;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v9}, Landroid/widget/TextView;->getLineHeight()I

    move-result v2

    .local v2, lineHeight:I
    iget-object v9, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mPos:[I

    const/4 v10, 0x0

    aget v9, v9, v10

    div-int/lit8 v10, v1, 0x2

    sub-int v7, v9, v10

    .local v7, xpos:I
    iget-object v9, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mPos:[I

    const/4 v10, 0x1

    aget v9, v9, v10

    sub-int/2addr v9, v0

    sub-int v8, v9, v2

    .local v8, ypos:I
    iget-object v9, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->this$0:Landroid/widget/NubiaCursorController;

    #getter for: Landroid/widget/NubiaCursorController;->mScreenSizePonit:Landroid/graphics/Point;
    invoke-static {v9}, Landroid/widget/NubiaCursorController;->access$100(Landroid/widget/NubiaCursorController;)Landroid/graphics/Point;

    move-result-object v9

    if-nez v9, :cond_0

    iget-object v9, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->this$0:Landroid/widget/NubiaCursorController;

    new-instance v10, Landroid/graphics/Point;

    invoke-direct {v10}, Landroid/graphics/Point;-><init>()V

    #setter for: Landroid/widget/NubiaCursorController;->mScreenSizePonit:Landroid/graphics/Point;
    invoke-static {v9, v10}, Landroid/widget/NubiaCursorController;->access$102(Landroid/widget/NubiaCursorController;Landroid/graphics/Point;)Landroid/graphics/Point;

    :cond_0
    iget-object v9, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mDisplay:Landroid/view/Display;

    iget-object v10, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->this$0:Landroid/widget/NubiaCursorController;

    #getter for: Landroid/widget/NubiaCursorController;->mScreenSizePonit:Landroid/graphics/Point;
    invoke-static {v10}, Landroid/widget/NubiaCursorController;->access$100(Landroid/widget/NubiaCursorController;)Landroid/graphics/Point;

    move-result-object v10

    invoke-virtual {v9, v10}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    iget-object v9, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->this$0:Landroid/widget/NubiaCursorController;

    #getter for: Landroid/widget/NubiaCursorController;->mScreenSizePonit:Landroid/graphics/Point;
    invoke-static {v9}, Landroid/widget/NubiaCursorController;->access$100(Landroid/widget/NubiaCursorController;)Landroid/graphics/Point;

    move-result-object v9

    iget v5, v9, Landroid/graphics/Point;->x:I

    .local v5, screenWidth:I
    iget-object v9, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->this$0:Landroid/widget/NubiaCursorController;

    #getter for: Landroid/widget/NubiaCursorController;->mScreenSizePonit:Landroid/graphics/Point;
    invoke-static {v9}, Landroid/widget/NubiaCursorController;->access$100(Landroid/widget/NubiaCursorController;)Landroid/graphics/Point;

    move-result-object v9

    iget v4, v9, Landroid/graphics/Point;->y:I

    .local v4, screenHeight:I
    div-int/lit8 v6, v1, 0x2

    .local v6, xoffset:I
    const/4 v3, 0x1

    .local v3, onTop:Z
    iget v9, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mStatusBarHeight:I

    if-ge v8, v9, :cond_1

    const/4 v3, 0x0

    iget-object v9, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mController:Landroid/widget/NubiaCursorController;

    invoke-virtual {v9}, Landroid/widget/NubiaCursorController;->computePanelPositionOnBottom()I

    move-result v8

    add-int v9, v8, v0

    if-le v9, v4, :cond_1

    iget-object v9, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->this$0:Landroid/widget/NubiaCursorController;

    invoke-virtual {v9}, Landroid/widget/NubiaCursorController;->computePanelPositionOnEndTop()I

    move-result v9

    sub-int/2addr v9, v2

    sub-int v8, v9, v0

    const/4 v3, 0x1

    :cond_1
    if-gez v7, :cond_3

    add-int/2addr v6, v7

    const/4 v7, 0x0

    :cond_2
    :goto_0
    iget-object v9, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mContent:Landroid/widget/FloatPanelView;

    invoke-virtual {v9, v3}, Landroid/widget/FloatPanelView;->setArrow(Z)V

    iget-object v9, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mContent:Landroid/widget/FloatPanelView;

    invoke-virtual {v9, v6}, Landroid/widget/FloatPanelView;->setArrowPos(I)V

    iget-object v9, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mContainer:Landroid/widget/PopupWindow;

    invoke-virtual {v9, v7, v8, v11, v11}, Landroid/widget/PopupWindow;->update(IIII)V

    return-void

    :cond_3
    add-int v9, v7, v1

    if-le v9, v5, :cond_2

    add-int v9, v7, v1

    sub-int/2addr v9, v5

    add-int/2addr v6, v9

    sub-int v7, v5, v1

    goto :goto_0
.end method


# virtual methods
.method public getElement(I)Landroid/view/View;
    .locals 1
    .parameter "viewId"

    .prologue
    iget-object v0, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mContent:Landroid/widget/FloatPanelView;

    invoke-virtual {v0, p1}, Landroid/widget/FloatPanelView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public hide()V
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mContainer:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    return-void
.end method

.method public isShowing()Z
    .locals 1

    .prologue
    iget-object v0, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mContainer:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    return v0
.end method

.method public setButtonOnClickListener(ILandroid/view/View$OnClickListener;)V
    .locals 4
    .parameter "viewId"
    .parameter "onClickListener"

    .prologue
    iget-object v1, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mContent:Landroid/widget/FloatPanelView;

    invoke-virtual {v1, p1}, Landroid/widget/FloatPanelView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .local v0, actionButton:Landroid/view/View;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :goto_0
    return-void

    :cond_0
    const-string v1, "NubiaCursorController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "FloatPanelView.setButtonOnClickListener, could not find view, id:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setButtonsBg([ILjava/util/ArrayList;)V
    .locals 8
    .parameter "buttonIds"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, values:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Boolean;>;"
    const/4 v7, 0x1

    const/4 v6, 0x0

    array-length v2, p1

    .local v2, length:I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v2}, Ljava/util/ArrayList;-><init>(I)V

    .local v3, showIds:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v1, 0x0

    .local v1, index:I
    :goto_0
    if-ge v1, v2, :cond_1

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Boolean;

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v5

    if-eqz v5, :cond_0

    aget v5, p1, v1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    .local v4, size:I
    if-ne v4, v7, :cond_3

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const v6, 0x1080704

    invoke-virtual {p0, v5, v6}, Landroid/widget/NubiaCursorController$FloatPanelViewController;->setElementBg(II)V

    :cond_2
    :goto_1
    return-void

    :cond_3
    if-le v4, v7, :cond_2

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const v6, 0x1080703

    invoke-virtual {p0, v5, v6}, Landroid/widget/NubiaCursorController$FloatPanelViewController;->setElementBg(II)V

    const/4 v0, 0x1

    .local v0, i:I
    :goto_2
    add-int/lit8 v5, v4, -0x1

    if-ge v0, v5, :cond_4

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const v6, 0x1080705

    invoke-virtual {p0, v5, v6}, Landroid/widget/NubiaCursorController$FloatPanelViewController;->setElementBg(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_4
    add-int/lit8 v5, v4, -0x1

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const v6, 0x1080707

    invoke-virtual {p0, v5, v6}, Landroid/widget/NubiaCursorController$FloatPanelViewController;->setElementBg(II)V

    goto :goto_1
.end method

.method public setElementBg(II)V
    .locals 2
    .parameter "viewId"
    .parameter "resId"

    .prologue
    iget-object v1, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mContent:Landroid/widget/FloatPanelView;

    invoke-virtual {v1, p1}, Landroid/widget/FloatPanelView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .local v0, view:Landroid/view/View;
    if-eqz v0, :cond_0

    invoke-virtual {v0, p2}, Landroid/view/View;->setBackgroundResource(I)V

    :cond_0
    return-void
.end method

.method public show()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    iget-object v0, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mContainer:Landroid/widget/PopupWindow;

    iget-object v1, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->this$0:Landroid/widget/NubiaCursorController;

    iget-object v1, v1, Landroid/widget/NubiaCursorController;->mTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v1, v2, v2, v2}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    invoke-direct {p0}, Landroid/widget/NubiaCursorController$FloatPanelViewController;->updatePosition()V

    return-void
.end method

.method public showAndUpdatePositionAsync()V
    .locals 2

    .prologue
    invoke-virtual {p0}, Landroid/widget/NubiaCursorController$FloatPanelViewController;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->this$0:Landroid/widget/NubiaCursorController;

    iget-object v0, v0, Landroid/widget/NubiaCursorController;->mTextView:Landroid/widget/TextView;

    new-instance v1, Landroid/widget/NubiaCursorController$FloatPanelViewController$2;

    invoke-direct {v1, p0}, Landroid/widget/NubiaCursorController$FloatPanelViewController$2;-><init>(Landroid/widget/NubiaCursorController$FloatPanelViewController;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Landroid/widget/NubiaCursorController$FloatPanelViewController;->show()V

    goto :goto_0
.end method

.method public showElement(IZ)V
    .locals 5
    .parameter "viewId"
    .parameter "isVisibility"

    .prologue
    iget-object v2, p0, Landroid/widget/NubiaCursorController$FloatPanelViewController;->mContent:Landroid/widget/FloatPanelView;

    invoke-virtual {v2, p1}, Landroid/widget/FloatPanelView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .local v0, view:Landroid/view/View;
    if-eqz v0, :cond_1

    if-eqz p2, :cond_0

    const/4 v1, 0x0

    .local v1, visibility:I
    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .end local v1           #visibility:I
    :goto_1
    return-void

    :cond_0
    const/16 v1, 0x8

    goto :goto_0

    :cond_1
    const-string v2, "NubiaCursorController"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "FloatPanelView.showElement, could not find view, id:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public showHideButtons([I[ILjava/util/ArrayList;)V
    .locals 6
    .parameter "buttonIds"
    .parameter "speratorIds"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I[I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, values:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/Boolean;>;"
    sget-boolean v4, Landroid/widget/NubiaCursorController$FloatPanelViewController;->$assertionsDisabled:Z

    if-nez v4, :cond_1

    array-length v4, p1

    array-length v5, p2

    add-int/lit8 v5, v5, 0x1

    if-ne v4, v5, :cond_0

    array-length v4, p1

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-eq v4, v5, :cond_1

    :cond_0
    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    :cond_1
    array-length v2, p1

    .local v2, length:I
    const/4 v0, 0x0

    .local v0, index:I
    :goto_0
    if-ge v0, v2, :cond_3

    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .local v1, isVisible:Z
    aget v4, p1, v0

    invoke-virtual {p0, v4, v1}, Landroid/widget/NubiaCursorController$FloatPanelViewController;->showElement(IZ)V

    if-eqz v0, :cond_2

    add-int/lit8 v4, v0, -0x1

    aget v3, p2, v4

    .local v3, sepratorId:I
    invoke-virtual {p0, v3, v1}, Landroid/widget/NubiaCursorController$FloatPanelViewController;->showElement(IZ)V

    .end local v3           #sepratorId:I
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .end local v1           #isVisible:Z
    :cond_3
    invoke-virtual {p0, p1, p3}, Landroid/widget/NubiaCursorController$FloatPanelViewController;->setButtonsBg([ILjava/util/ArrayList;)V

    return-void
.end method
