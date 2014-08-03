.class public Lnubia/ui/ProtoSearchView;
.super Ljava/lang/Object;
.source "ProtoSearchView.java"

# interfaces
.implements Lnubia/ui/ISearchView;


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .parameter "context"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnubia/ui/ProtoSearchView;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public getDecoratedHint()Z
    .locals 1

    .prologue
    const/4 v0, 0x0

    return v0
.end method

.method public getSearchViewLayout()I
    .locals 1

    .prologue
    const v0, 0x10900a5

    return v0
.end method

.method public setUseDropDownOriginStyle(Landroid/widget/SearchView$SearchAutoComplete;)V
    .locals 0
    .parameter "mQueryTextView"

    .prologue
    return-void
.end method
