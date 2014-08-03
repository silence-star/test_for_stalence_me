.class final Landroid/app/NubiaThemeHelper$UnitEntry;
.super Ljava/lang/Object;
.source "NubiaThemeHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/app/NubiaThemeHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "UnitEntry"
.end annotation


# instance fields
.field name:Ljava/lang/String;

.field scale:F

.field type:I

.field unit:I


# direct methods
.method constructor <init>(Ljava/lang/String;IIF)V
    .locals 0
    .parameter "name"
    .parameter "type"
    .parameter "unit"
    .parameter "scale"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Landroid/app/NubiaThemeHelper$UnitEntry;->name:Ljava/lang/String;

    iput p2, p0, Landroid/app/NubiaThemeHelper$UnitEntry;->type:I

    iput p3, p0, Landroid/app/NubiaThemeHelper$UnitEntry;->unit:I

    iput p4, p0, Landroid/app/NubiaThemeHelper$UnitEntry;->scale:F

    return-void
.end method
