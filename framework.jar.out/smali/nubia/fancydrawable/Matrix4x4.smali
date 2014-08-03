.class public Lnubia/fancydrawable/Matrix4x4;
.super Ljava/lang/Object;
.source "Matrix4x4.java"


# instance fields
.field private final NUM:I

.field private mValue:[F


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/16 v0, 0x10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v0, p0, Lnubia/fancydrawable/Matrix4x4;->NUM:I

    new-array v0, v0, [F

    iput-object v0, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    invoke-virtual {p0}, Lnubia/fancydrawable/Matrix4x4;->identity()V

    return-void
.end method

.method public constructor <init>(Lnubia/fancydrawable/Matrix4x4;)V
    .locals 3
    .parameter "matrix"

    .prologue
    const/16 v2, 0x10

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput v2, p0, Lnubia/fancydrawable/Matrix4x4;->NUM:I

    new-array v1, v2, [F

    iput-object v1, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    if-eqz p1, :cond_0

    new-array v0, v2, [F

    .local v0, value:[F
    invoke-virtual {p1, v0}, Lnubia/fancydrawable/Matrix4x4;->getValues([F)V

    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->setValues([F)V

    .end local v0           #value:[F
    :goto_0
    return-void

    :cond_0
    invoke-virtual {p0}, Lnubia/fancydrawable/Matrix4x4;->identity()V

    goto :goto_0
.end method

.method private operate([F[F[F)V
    .locals 9
    .parameter "value"
    .parameter "valueA"
    .parameter "valueB"

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    aget v0, p2, v4

    aget v1, p3, v4

    mul-float/2addr v0, v1

    aget v1, p2, v5

    aget v2, p3, v8

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    aget v1, p2, v6

    const/16 v2, 0x8

    aget v2, p3, v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    aget v1, p2, v7

    const/16 v2, 0xc

    aget v2, p3, v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    aput v0, p1, v4

    aget v0, p2, v4

    aget v1, p3, v5

    mul-float/2addr v0, v1

    aget v1, p2, v5

    const/4 v2, 0x5

    aget v2, p3, v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    aget v1, p2, v6

    const/16 v2, 0x9

    aget v2, p3, v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    aget v1, p2, v7

    const/16 v2, 0xd

    aget v2, p3, v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    aput v0, p1, v5

    aget v0, p2, v4

    aget v1, p3, v6

    mul-float/2addr v0, v1

    aget v1, p2, v5

    const/4 v2, 0x6

    aget v2, p3, v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    aget v1, p2, v6

    const/16 v2, 0xa

    aget v2, p3, v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    aget v1, p2, v7

    const/16 v2, 0xe

    aget v2, p3, v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    aput v0, p1, v6

    aget v0, p2, v4

    aget v1, p3, v7

    mul-float/2addr v0, v1

    aget v1, p2, v5

    const/4 v2, 0x7

    aget v2, p3, v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    aget v1, p2, v6

    const/16 v2, 0xb

    aget v2, p3, v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    aget v1, p2, v7

    const/16 v2, 0xf

    aget v2, p3, v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    aput v0, p1, v7

    aget v0, p2, v8

    aget v1, p3, v4

    mul-float/2addr v0, v1

    const/4 v1, 0x5

    aget v1, p2, v1

    aget v2, p3, v8

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    const/4 v1, 0x6

    aget v1, p2, v1

    const/16 v2, 0x8

    aget v2, p3, v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    const/4 v1, 0x7

    aget v1, p2, v1

    const/16 v2, 0xc

    aget v2, p3, v2

    mul-float/2addr v1, v2

    add-float/2addr v0, v1

    aput v0, p1, v8

    const/4 v0, 0x5

    aget v1, p2, v8

    aget v2, p3, v5

    mul-float/2addr v1, v2

    const/4 v2, 0x5

    aget v2, p2, v2

    const/4 v3, 0x5

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/4 v2, 0x6

    aget v2, p2, v2

    const/16 v3, 0x9

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/4 v2, 0x7

    aget v2, p2, v2

    const/16 v3, 0xd

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    aput v1, p1, v0

    const/4 v0, 0x6

    aget v1, p2, v8

    aget v2, p3, v6

    mul-float/2addr v1, v2

    const/4 v2, 0x5

    aget v2, p2, v2

    const/4 v3, 0x6

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/4 v2, 0x6

    aget v2, p2, v2

    const/16 v3, 0xa

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/4 v2, 0x7

    aget v2, p2, v2

    const/16 v3, 0xe

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    aput v1, p1, v0

    const/4 v0, 0x7

    aget v1, p2, v8

    aget v2, p3, v7

    mul-float/2addr v1, v2

    const/4 v2, 0x5

    aget v2, p2, v2

    const/4 v3, 0x7

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/4 v2, 0x6

    aget v2, p2, v2

    const/16 v3, 0xb

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/4 v2, 0x7

    aget v2, p2, v2

    const/16 v3, 0xf

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    aput v1, p1, v0

    const/16 v0, 0x8

    const/16 v1, 0x8

    aget v1, p2, v1

    aget v2, p3, v4

    mul-float/2addr v1, v2

    const/16 v2, 0x9

    aget v2, p2, v2

    aget v3, p3, v8

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/16 v2, 0xa

    aget v2, p2, v2

    const/16 v3, 0x8

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/16 v2, 0xb

    aget v2, p2, v2

    const/16 v3, 0xc

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    aput v1, p1, v0

    const/16 v0, 0x9

    const/16 v1, 0x8

    aget v1, p2, v1

    aget v2, p3, v5

    mul-float/2addr v1, v2

    const/16 v2, 0x9

    aget v2, p2, v2

    const/4 v3, 0x5

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/16 v2, 0xa

    aget v2, p2, v2

    const/16 v3, 0x9

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/16 v2, 0xb

    aget v2, p2, v2

    const/16 v3, 0xd

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    aput v1, p1, v0

    const/16 v0, 0xa

    const/16 v1, 0x8

    aget v1, p2, v1

    aget v2, p3, v6

    mul-float/2addr v1, v2

    const/16 v2, 0x9

    aget v2, p2, v2

    const/4 v3, 0x6

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/16 v2, 0xa

    aget v2, p2, v2

    const/16 v3, 0xa

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/16 v2, 0xb

    aget v2, p2, v2

    const/16 v3, 0xe

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    aput v1, p1, v0

    const/16 v0, 0xb

    const/16 v1, 0x8

    aget v1, p2, v1

    aget v2, p3, v7

    mul-float/2addr v1, v2

    const/16 v2, 0x9

    aget v2, p2, v2

    const/4 v3, 0x7

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/16 v2, 0xa

    aget v2, p2, v2

    const/16 v3, 0xb

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/16 v2, 0xb

    aget v2, p2, v2

    const/16 v3, 0xf

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    aput v1, p1, v0

    const/16 v0, 0xc

    const/16 v1, 0xc

    aget v1, p2, v1

    aget v2, p3, v4

    mul-float/2addr v1, v2

    const/16 v2, 0xd

    aget v2, p2, v2

    aget v3, p3, v8

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/16 v2, 0xe

    aget v2, p2, v2

    const/16 v3, 0x8

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/16 v2, 0xf

    aget v2, p2, v2

    const/16 v3, 0xc

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    aput v1, p1, v0

    const/16 v0, 0xd

    const/16 v1, 0xc

    aget v1, p2, v1

    aget v2, p3, v5

    mul-float/2addr v1, v2

    const/16 v2, 0xd

    aget v2, p2, v2

    const/4 v3, 0x5

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/16 v2, 0xe

    aget v2, p2, v2

    const/16 v3, 0x9

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/16 v2, 0xf

    aget v2, p2, v2

    const/16 v3, 0xd

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    aput v1, p1, v0

    const/16 v0, 0xe

    const/16 v1, 0xc

    aget v1, p2, v1

    aget v2, p3, v6

    mul-float/2addr v1, v2

    const/16 v2, 0xd

    aget v2, p2, v2

    const/4 v3, 0x6

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/16 v2, 0xe

    aget v2, p2, v2

    const/16 v3, 0xa

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/16 v2, 0xf

    aget v2, p2, v2

    const/16 v3, 0xe

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    aput v1, p1, v0

    const/16 v0, 0xf

    const/16 v1, 0xc

    aget v1, p2, v1

    aget v2, p3, v7

    mul-float/2addr v1, v2

    const/16 v2, 0xd

    aget v2, p2, v2

    const/4 v3, 0x7

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/16 v2, 0xe

    aget v2, p2, v2

    const/16 v3, 0xb

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    const/16 v2, 0xf

    aget v2, p2, v2

    const/16 v3, 0xf

    aget v3, p3, v3

    mul-float/2addr v2, v3

    add-float/2addr v1, v2

    aput v1, p1, v0

    return-void
.end method

.method private rotateX(F)Lnubia/fancydrawable/Matrix4x4;
    .locals 11
    .parameter "degree"

    .prologue
    const/high16 v10, 0x3f80

    const/4 v9, 0x0

    const/16 v5, 0x10

    new-array v4, v5, [F

    .local v4, value:[F
    new-instance v2, Lnubia/fancydrawable/Matrix4x4;

    invoke-direct {v2}, Lnubia/fancydrawable/Matrix4x4;-><init>()V

    .local v2, matrix:Lnubia/fancydrawable/Matrix4x4;
    float-to-double v5, p1

    const-wide v7, 0x400921fb54442d18L

    mul-double/2addr v5, v7

    const-wide v7, 0x4066800000000000L

    div-double/2addr v5, v7

    double-to-float v0, v5

    .local v0, angle:F
    float-to-double v5, v0

    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    move-result-wide v5

    double-to-float v3, v5

    .local v3, sina:F
    float-to-double v5, v0

    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    double-to-float v1, v5

    .local v1, cosa:F
    const/4 v5, 0x0

    aput v10, v4, v5

    const/4 v5, 0x1

    aput v9, v4, v5

    const/4 v5, 0x2

    aput v9, v4, v5

    const/4 v5, 0x3

    aput v9, v4, v5

    const/4 v5, 0x4

    aput v9, v4, v5

    const/4 v5, 0x5

    aput v1, v4, v5

    const/4 v5, 0x6

    neg-float v6, v3

    aput v6, v4, v5

    const/4 v5, 0x7

    aput v9, v4, v5

    const/16 v5, 0x8

    aput v9, v4, v5

    const/16 v5, 0x9

    aput v3, v4, v5

    const/16 v5, 0xa

    aput v1, v4, v5

    const/16 v5, 0xb

    aput v9, v4, v5

    const/16 v5, 0xc

    aput v9, v4, v5

    const/16 v5, 0xd

    aput v9, v4, v5

    const/16 v5, 0xe

    aput v9, v4, v5

    const/16 v5, 0xf

    aput v10, v4, v5

    invoke-virtual {v2, v4}, Lnubia/fancydrawable/Matrix4x4;->setValues([F)V

    return-object v2
.end method

.method private rotateY(F)Lnubia/fancydrawable/Matrix4x4;
    .locals 11
    .parameter "degree"

    .prologue
    const/high16 v10, 0x3f80

    const/4 v9, 0x0

    const/16 v5, 0x10

    new-array v4, v5, [F

    .local v4, value:[F
    new-instance v2, Lnubia/fancydrawable/Matrix4x4;

    invoke-direct {v2}, Lnubia/fancydrawable/Matrix4x4;-><init>()V

    .local v2, matrix:Lnubia/fancydrawable/Matrix4x4;
    float-to-double v5, p1

    const-wide v7, 0x400921fb54442d18L

    mul-double/2addr v5, v7

    const-wide v7, 0x4066800000000000L

    div-double/2addr v5, v7

    double-to-float v0, v5

    .local v0, angle:F
    float-to-double v5, v0

    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    move-result-wide v5

    double-to-float v3, v5

    .local v3, sina:F
    float-to-double v5, v0

    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    double-to-float v1, v5

    .local v1, cosa:F
    const/4 v5, 0x0

    aput v1, v4, v5

    const/4 v5, 0x1

    aput v9, v4, v5

    const/4 v5, 0x2

    aput v3, v4, v5

    const/4 v5, 0x3

    aput v9, v4, v5

    const/4 v5, 0x4

    aput v9, v4, v5

    const/4 v5, 0x5

    aput v10, v4, v5

    const/4 v5, 0x6

    aput v9, v4, v5

    const/4 v5, 0x7

    aput v9, v4, v5

    const/16 v5, 0x8

    neg-float v6, v3

    aput v6, v4, v5

    const/16 v5, 0x9

    aput v9, v4, v5

    const/16 v5, 0xa

    aput v1, v4, v5

    const/16 v5, 0xb

    aput v9, v4, v5

    const/16 v5, 0xc

    aput v9, v4, v5

    const/16 v5, 0xd

    aput v9, v4, v5

    const/16 v5, 0xe

    aput v9, v4, v5

    const/16 v5, 0xf

    aput v10, v4, v5

    invoke-virtual {v2, v4}, Lnubia/fancydrawable/Matrix4x4;->setValues([F)V

    return-object v2
.end method

.method private rotateZ(F)Lnubia/fancydrawable/Matrix4x4;
    .locals 11
    .parameter "degree"

    .prologue
    const/high16 v10, 0x3f80

    const/4 v9, 0x0

    const/16 v5, 0x10

    new-array v4, v5, [F

    .local v4, value:[F
    new-instance v2, Lnubia/fancydrawable/Matrix4x4;

    invoke-direct {v2}, Lnubia/fancydrawable/Matrix4x4;-><init>()V

    .local v2, matrix:Lnubia/fancydrawable/Matrix4x4;
    float-to-double v5, p1

    const-wide v7, 0x400921fb54442d18L

    mul-double/2addr v5, v7

    const-wide v7, 0x4066800000000000L

    div-double/2addr v5, v7

    double-to-float v0, v5

    .local v0, angle:F
    float-to-double v5, v0

    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    move-result-wide v5

    double-to-float v3, v5

    .local v3, sina:F
    float-to-double v5, v0

    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    move-result-wide v5

    double-to-float v1, v5

    .local v1, cosa:F
    const/4 v5, 0x0

    aput v1, v4, v5

    const/4 v5, 0x1

    neg-float v6, v3

    aput v6, v4, v5

    const/4 v5, 0x2

    aput v9, v4, v5

    const/4 v5, 0x3

    aput v9, v4, v5

    const/4 v5, 0x4

    aput v3, v4, v5

    const/4 v5, 0x5

    aput v1, v4, v5

    const/4 v5, 0x6

    aput v9, v4, v5

    const/4 v5, 0x7

    aput v9, v4, v5

    const/16 v5, 0x8

    aput v9, v4, v5

    const/16 v5, 0x9

    aput v9, v4, v5

    const/16 v5, 0xa

    aput v10, v4, v5

    const/16 v5, 0xb

    aput v9, v4, v5

    const/16 v5, 0xc

    aput v9, v4, v5

    const/16 v5, 0xd

    aput v9, v4, v5

    const/16 v5, 0xe

    aput v9, v4, v5

    const/16 v5, 0xf

    aput v10, v4, v5

    invoke-virtual {v2, v4}, Lnubia/fancydrawable/Matrix4x4;->setValues([F)V

    return-object v2
.end method

.method private scale(FFF)Lnubia/fancydrawable/Matrix4x4;
    .locals 4
    .parameter "sx"
    .parameter "sy"
    .parameter "sz"

    .prologue
    const/4 v3, 0x0

    const/16 v2, 0x10

    new-array v1, v2, [F

    .local v1, value:[F
    new-instance v0, Lnubia/fancydrawable/Matrix4x4;

    invoke-direct {v0}, Lnubia/fancydrawable/Matrix4x4;-><init>()V

    .local v0, matrix:Lnubia/fancydrawable/Matrix4x4;
    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 v2, 0x1

    aput v3, v1, v2

    const/4 v2, 0x2

    aput v3, v1, v2

    const/4 v2, 0x3

    aput v3, v1, v2

    const/4 v2, 0x4

    aput v3, v1, v2

    const/4 v2, 0x5

    aput p2, v1, v2

    const/4 v2, 0x6

    aput v3, v1, v2

    const/4 v2, 0x7

    aput v3, v1, v2

    const/16 v2, 0x8

    aput v3, v1, v2

    const/16 v2, 0x9

    aput v3, v1, v2

    const/16 v2, 0xa

    aput p3, v1, v2

    const/16 v2, 0xb

    aput v3, v1, v2

    const/16 v2, 0xc

    aput v3, v1, v2

    const/16 v2, 0xd

    aput v3, v1, v2

    const/16 v2, 0xe

    aput v3, v1, v2

    const/16 v2, 0xf

    const/high16 v3, 0x3f80

    aput v3, v1, v2

    invoke-virtual {v0, v1}, Lnubia/fancydrawable/Matrix4x4;->setValues([F)V

    return-object v0
.end method

.method private translate(FFF)Lnubia/fancydrawable/Matrix4x4;
    .locals 5
    .parameter "dx"
    .parameter "dy"
    .parameter "dz"

    .prologue
    const/high16 v4, 0x3f80

    const/4 v3, 0x0

    const/16 v2, 0x10

    new-array v1, v2, [F

    .local v1, value:[F
    new-instance v0, Lnubia/fancydrawable/Matrix4x4;

    invoke-direct {v0}, Lnubia/fancydrawable/Matrix4x4;-><init>()V

    .local v0, matrix:Lnubia/fancydrawable/Matrix4x4;
    const/4 v2, 0x0

    aput v4, v1, v2

    const/4 v2, 0x1

    aput v3, v1, v2

    const/4 v2, 0x2

    aput v3, v1, v2

    const/4 v2, 0x3

    aput p1, v1, v2

    const/4 v2, 0x4

    aput v3, v1, v2

    const/4 v2, 0x5

    aput v4, v1, v2

    const/4 v2, 0x6

    aput v3, v1, v2

    const/4 v2, 0x7

    aput p2, v1, v2

    const/16 v2, 0x8

    aput v3, v1, v2

    const/16 v2, 0x9

    aput v3, v1, v2

    const/16 v2, 0xa

    aput v4, v1, v2

    const/16 v2, 0xb

    aput p3, v1, v2

    const/16 v2, 0xc

    aput v3, v1, v2

    const/16 v2, 0xd

    aput v3, v1, v2

    const/16 v2, 0xe

    aput v3, v1, v2

    const/16 v2, 0xf

    aput v4, v1, v2

    invoke-virtual {v0, v1}, Lnubia/fancydrawable/Matrix4x4;->setValues([F)V

    return-object v0
.end method


# virtual methods
.method public camera(FFFFFFFFFFF)Lnubia/fancydrawable/Matrix4x4;
    .locals 16
    .parameter "scaleX"
    .parameter "scaleY"
    .parameter "translateX"
    .parameter "translateY"
    .parameter "nearPlane"
    .parameter "cameraDistance"
    .parameter "cameraUp"
    .parameter "cameraLeft"
    .parameter "cameraTilt"
    .parameter "cameraPan"
    .parameter "cameraRoll"

    .prologue
    const/16 v12, 0x10

    new-array v11, v12, [F

    .local v11, value:[F
    new-instance v7, Lnubia/fancydrawable/Matrix4x4;

    invoke-direct {v7}, Lnubia/fancydrawable/Matrix4x4;-><init>()V

    .local v7, matrix:Lnubia/fancydrawable/Matrix4x4;
    move/from16 v0, p9

    float-to-double v12, v0

    const-wide v14, 0x400921fb54442d18L

    mul-double/2addr v12, v14

    const-wide v14, 0x4066800000000000L

    div-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->sin(D)D

    move-result-wide v12

    double-to-float v10, v12

    .local v10, sinT:F
    move/from16 v0, p9

    float-to-double v12, v0

    const-wide v14, 0x400921fb54442d18L

    mul-double/2addr v12, v14

    const-wide v14, 0x4066800000000000L

    div-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->cos(D)D

    move-result-wide v12

    double-to-float v6, v12

    .local v6, cosT:F
    move/from16 v0, p10

    float-to-double v12, v0

    const-wide v14, 0x400921fb54442d18L

    mul-double/2addr v12, v14

    const-wide v14, 0x4066800000000000L

    div-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->sin(D)D

    move-result-wide v12

    double-to-float v8, v12

    .local v8, sinP:F
    move/from16 v0, p10

    float-to-double v12, v0

    const-wide v14, 0x400921fb54442d18L

    mul-double/2addr v12, v14

    const-wide v14, 0x4066800000000000L

    div-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->cos(D)D

    move-result-wide v12

    double-to-float v4, v12

    .local v4, cosP:F
    move/from16 v0, p11

    float-to-double v12, v0

    const-wide v14, 0x400921fb54442d18L

    mul-double/2addr v12, v14

    const-wide v14, 0x4066800000000000L

    div-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->sin(D)D

    move-result-wide v12

    double-to-float v9, v12

    .local v9, sinR:F
    move/from16 v0, p11

    float-to-double v12, v0

    const-wide v14, 0x400921fb54442d18L

    mul-double/2addr v12, v14

    const-wide v14, 0x4066800000000000L

    div-double/2addr v12, v14

    invoke-static {v12, v13}, Ljava/lang/Math;->cos(D)D

    move-result-wide v12

    double-to-float v5, v12

    .local v5, cosR:F
    mul-float v12, v5, v6

    mul-float/2addr v12, v8

    mul-float v13, v10, v9

    add-float v1, v12, v13

    .local v1, G:F
    mul-float v12, v9, v6

    mul-float/2addr v12, v8

    mul-float v13, v10, v5

    sub-float v2, v12, v13

    .local v2, H:F
    mul-float v3, v6, v4

    .local v3, I:F
    const/4 v12, 0x0

    mul-float v13, v4, v5

    mul-float v13, v13, p1

    div-float v14, p3, p5

    mul-float/2addr v14, v1

    add-float/2addr v13, v14

    aput v13, v11, v12

    const/4 v12, 0x1

    mul-float v13, v4, v9

    mul-float v13, v13, p1

    div-float v14, p3, p5

    mul-float/2addr v14, v2

    add-float/2addr v13, v14

    aput v13, v11, v12

    const/4 v12, 0x2

    const/high16 v13, -0x4080

    mul-float/2addr v13, v8

    mul-float v13, v13, p1

    div-float v14, p3, p5

    mul-float/2addr v14, v3

    add-float/2addr v13, v14

    aput v13, v11, v12

    const/4 v12, 0x3

    mul-float v13, p1, p8

    div-float v14, p3, p5

    mul-float v14, v14, p6

    add-float/2addr v13, v14

    aput v13, v11, v12

    const/4 v12, 0x4

    mul-float v13, v5, v10

    mul-float/2addr v13, v8

    mul-float v14, v6, v9

    sub-float/2addr v13, v14

    mul-float v13, v13, p2

    div-float v14, p4, p5

    mul-float/2addr v14, v1

    add-float/2addr v13, v14

    aput v13, v11, v12

    const/4 v12, 0x5

    mul-float v13, v9, v10

    mul-float/2addr v13, v8

    mul-float v14, v6, v5

    add-float/2addr v13, v14

    mul-float v13, v13, p2

    div-float v14, p4, p5

    mul-float/2addr v14, v2

    add-float/2addr v13, v14

    aput v13, v11, v12

    const/4 v12, 0x6

    mul-float v13, v4, v10

    mul-float v13, v13, p2

    div-float v14, p4, p5

    mul-float/2addr v14, v3

    add-float/2addr v13, v14

    aput v13, v11, v12

    const/4 v12, 0x7

    mul-float v13, p2, p7

    div-float v14, p4, p5

    mul-float v14, v14, p6

    add-float/2addr v13, v14

    aput v13, v11, v12

    const/16 v12, 0x8

    aput v1, v11, v12

    const/16 v12, 0x9

    aput v2, v11, v12

    const/16 v12, 0xa

    aput v3, v11, v12

    const/16 v12, 0xb

    aput p6, v11, v12

    const/16 v12, 0xc

    div-float v13, v1, p5

    aput v13, v11, v12

    const/16 v12, 0xd

    div-float v13, v2, p5

    aput v13, v11, v12

    const/16 v12, 0xe

    div-float v13, v3, p5

    aput v13, v11, v12

    const/16 v12, 0xf

    div-float v13, p6, p5

    aput v13, v11, v12

    invoke-virtual {v7, v11}, Lnubia/fancydrawable/Matrix4x4;->setValues([F)V

    return-object v7
.end method

.method public getMatrix()Landroid/graphics/Matrix;
    .locals 8

    .prologue
    const/4 v7, 0x5

    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/16 v2, 0x10

    new-array v1, v2, [F

    .local v1, value9:[F
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .local v0, matrix:Landroid/graphics/Matrix;
    iget-object v2, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    aget v2, v2, v3

    aput v2, v1, v3

    iget-object v2, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    aget v2, v2, v4

    aput v2, v1, v4

    const/4 v2, 0x2

    iget-object v3, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    aget v3, v3, v5

    aput v3, v1, v2

    iget-object v2, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    aget v2, v2, v6

    aput v2, v1, v5

    iget-object v2, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    aget v2, v2, v7

    aput v2, v1, v6

    iget-object v2, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    const/4 v3, 0x7

    aget v2, v2, v3

    aput v2, v1, v7

    const/4 v2, 0x6

    iget-object v3, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    const/16 v4, 0xc

    aget v3, v3, v4

    aput v3, v1, v2

    const/4 v2, 0x7

    iget-object v3, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    const/16 v4, 0xd

    aget v3, v3, v4

    aput v3, v1, v2

    const/16 v2, 0x8

    iget-object v3, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    const/16 v4, 0xf

    aget v3, v3, v4

    aput v3, v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->setValues([F)V

    return-object v0
.end method

.method public getValues([F)V
    .locals 2
    .parameter "value"

    .prologue
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    const/16 v1, 0x10

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    aget v1, v1, v0

    aput v1, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public identity()V
    .locals 4

    .prologue
    const/high16 v3, 0x3f80

    const/4 v2, 0x0

    iget-object v0, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    const/4 v1, 0x0

    aput v3, v0, v1

    iget-object v0, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    const/4 v1, 0x1

    aput v2, v0, v1

    iget-object v0, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    const/4 v1, 0x2

    aput v2, v0, v1

    iget-object v0, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    const/4 v1, 0x3

    aput v2, v0, v1

    iget-object v0, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    const/4 v1, 0x4

    aput v2, v0, v1

    iget-object v0, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    const/4 v1, 0x5

    aput v3, v0, v1

    iget-object v0, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    const/4 v1, 0x6

    aput v2, v0, v1

    iget-object v0, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    const/4 v1, 0x7

    aput v2, v0, v1

    iget-object v0, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    const/16 v1, 0x8

    aput v2, v0, v1

    iget-object v0, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    const/16 v1, 0x9

    aput v2, v0, v1

    iget-object v0, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    const/16 v1, 0xa

    aput v3, v0, v1

    iget-object v0, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    const/16 v1, 0xb

    aput v2, v0, v1

    iget-object v0, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    const/16 v1, 0xc

    aput v2, v0, v1

    iget-object v0, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    const/16 v1, 0xd

    aput v2, v0, v1

    iget-object v0, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    const/16 v1, 0xe

    aput v2, v0, v1

    iget-object v0, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    const/16 v1, 0xf

    aput v3, v0, v1

    return-void
.end method

.method public invert(Lnubia/fancydrawable/Matrix4x4;)Z
    .locals 1
    .parameter "inverse"

    .prologue
    const/4 v0, 0x0

    return v0
.end method

.method public postCamera(FFFFFFFFFFF)Z
    .locals 2
    .parameter "scaleX"
    .parameter "scaleY"
    .parameter "translateX"
    .parameter "translateY"
    .parameter "nearPlane"
    .parameter "cameraDistance"
    .parameter "cameraUp"
    .parameter "cameraLeft"
    .parameter "cameraTilt"
    .parameter "cameraPan"
    .parameter "cameraRoll"

    .prologue
    invoke-virtual/range {p0 .. p11}, Lnubia/fancydrawable/Matrix4x4;->camera(FFFFFFFFFFF)Lnubia/fancydrawable/Matrix4x4;

    move-result-object v0

    .local v0, matrix:Lnubia/fancydrawable/Matrix4x4;
    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->postContact(Lnubia/fancydrawable/Matrix4x4;)Z

    const/4 v1, 0x1

    return v1
.end method

.method public postContact(Lnubia/fancydrawable/Matrix4x4;)Z
    .locals 4
    .parameter "matrix"

    .prologue
    const/16 v3, 0x10

    new-array v0, v3, [F

    .local v0, value:[F
    new-array v1, v3, [F

    .local v1, valueA:[F
    new-array v2, v3, [F

    .local v2, valueB:[F
    invoke-virtual {p1, v1}, Lnubia/fancydrawable/Matrix4x4;->getValues([F)V

    invoke-virtual {p0, v2}, Lnubia/fancydrawable/Matrix4x4;->getValues([F)V

    invoke-direct {p0, v0, v1, v2}, Lnubia/fancydrawable/Matrix4x4;->operate([F[F[F)V

    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->setValues([F)V

    const/4 v3, 0x1

    return v3
.end method

.method public postRotateX(F)Z
    .locals 2
    .parameter "degree"

    .prologue
    invoke-direct {p0, p1}, Lnubia/fancydrawable/Matrix4x4;->rotateX(F)Lnubia/fancydrawable/Matrix4x4;

    move-result-object v0

    .local v0, matrix:Lnubia/fancydrawable/Matrix4x4;
    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->postContact(Lnubia/fancydrawable/Matrix4x4;)Z

    const/4 v1, 0x1

    return v1
.end method

.method public postRotateY(F)Z
    .locals 2
    .parameter "degree"

    .prologue
    invoke-direct {p0, p1}, Lnubia/fancydrawable/Matrix4x4;->rotateY(F)Lnubia/fancydrawable/Matrix4x4;

    move-result-object v0

    .local v0, matrix:Lnubia/fancydrawable/Matrix4x4;
    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->postContact(Lnubia/fancydrawable/Matrix4x4;)Z

    const/4 v1, 0x1

    return v1
.end method

.method public postRotateZ(F)Z
    .locals 2
    .parameter "degree"

    .prologue
    invoke-direct {p0, p1}, Lnubia/fancydrawable/Matrix4x4;->rotateZ(F)Lnubia/fancydrawable/Matrix4x4;

    move-result-object v0

    .local v0, matrix:Lnubia/fancydrawable/Matrix4x4;
    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->postContact(Lnubia/fancydrawable/Matrix4x4;)Z

    const/4 v1, 0x1

    return v1
.end method

.method public postScale(FFF)Z
    .locals 2
    .parameter "sx"
    .parameter "sy"
    .parameter "sz"

    .prologue
    invoke-direct {p0, p1, p2, p3}, Lnubia/fancydrawable/Matrix4x4;->scale(FFF)Lnubia/fancydrawable/Matrix4x4;

    move-result-object v0

    .local v0, matrix:Lnubia/fancydrawable/Matrix4x4;
    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->postContact(Lnubia/fancydrawable/Matrix4x4;)Z

    const/4 v1, 0x1

    return v1
.end method

.method public postTranslate(FFF)Z
    .locals 2
    .parameter "dx"
    .parameter "dy"
    .parameter "dz"

    .prologue
    invoke-direct {p0, p1, p2, p3}, Lnubia/fancydrawable/Matrix4x4;->translate(FFF)Lnubia/fancydrawable/Matrix4x4;

    move-result-object v0

    .local v0, matrix:Lnubia/fancydrawable/Matrix4x4;
    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->postContact(Lnubia/fancydrawable/Matrix4x4;)Z

    const/4 v1, 0x1

    return v1
.end method

.method public preCamera(FFFFFFFFFFF)Z
    .locals 2
    .parameter "scaleX"
    .parameter "scaleY"
    .parameter "translateX"
    .parameter "translateY"
    .parameter "nearPlane"
    .parameter "cameraDistance"
    .parameter "cameraUp"
    .parameter "cameraLeft"
    .parameter "cameraTilt"
    .parameter "cameraPan"
    .parameter "cameraRoll"

    .prologue
    invoke-virtual/range {p0 .. p11}, Lnubia/fancydrawable/Matrix4x4;->camera(FFFFFFFFFFF)Lnubia/fancydrawable/Matrix4x4;

    move-result-object v0

    .local v0, matrix:Lnubia/fancydrawable/Matrix4x4;
    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->preContact(Lnubia/fancydrawable/Matrix4x4;)Z

    const/4 v1, 0x1

    return v1
.end method

.method public preContact(Lnubia/fancydrawable/Matrix4x4;)Z
    .locals 4
    .parameter "matrix"

    .prologue
    const/16 v3, 0x10

    new-array v0, v3, [F

    .local v0, value:[F
    new-array v1, v3, [F

    .local v1, valueA:[F
    new-array v2, v3, [F

    .local v2, valueB:[F
    invoke-virtual {p1, v1}, Lnubia/fancydrawable/Matrix4x4;->getValues([F)V

    invoke-virtual {p0, v2}, Lnubia/fancydrawable/Matrix4x4;->getValues([F)V

    invoke-direct {p0, v0, v2, v1}, Lnubia/fancydrawable/Matrix4x4;->operate([F[F[F)V

    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->setValues([F)V

    const/4 v3, 0x1

    return v3
.end method

.method public preRotateX(F)Z
    .locals 2
    .parameter "degree"

    .prologue
    invoke-direct {p0, p1}, Lnubia/fancydrawable/Matrix4x4;->rotateX(F)Lnubia/fancydrawable/Matrix4x4;

    move-result-object v0

    .local v0, matrix:Lnubia/fancydrawable/Matrix4x4;
    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->preContact(Lnubia/fancydrawable/Matrix4x4;)Z

    const/4 v1, 0x1

    return v1
.end method

.method public preRotateY(F)Z
    .locals 2
    .parameter "degree"

    .prologue
    invoke-direct {p0, p1}, Lnubia/fancydrawable/Matrix4x4;->rotateY(F)Lnubia/fancydrawable/Matrix4x4;

    move-result-object v0

    .local v0, matrix:Lnubia/fancydrawable/Matrix4x4;
    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->preContact(Lnubia/fancydrawable/Matrix4x4;)Z

    const/4 v1, 0x1

    return v1
.end method

.method public preRotateZ(F)Z
    .locals 2
    .parameter "degree"

    .prologue
    invoke-direct {p0, p1}, Lnubia/fancydrawable/Matrix4x4;->rotateZ(F)Lnubia/fancydrawable/Matrix4x4;

    move-result-object v0

    .local v0, matrix:Lnubia/fancydrawable/Matrix4x4;
    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->preContact(Lnubia/fancydrawable/Matrix4x4;)Z

    const/4 v1, 0x1

    return v1
.end method

.method public preScale(FFF)Z
    .locals 2
    .parameter "sx"
    .parameter "sy"
    .parameter "sz"

    .prologue
    invoke-direct {p0, p1, p2, p3}, Lnubia/fancydrawable/Matrix4x4;->scale(FFF)Lnubia/fancydrawable/Matrix4x4;

    move-result-object v0

    .local v0, matrix:Lnubia/fancydrawable/Matrix4x4;
    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->preContact(Lnubia/fancydrawable/Matrix4x4;)Z

    const/4 v1, 0x1

    return v1
.end method

.method public preTranslate(FFF)Z
    .locals 2
    .parameter "dx"
    .parameter "dy"
    .parameter "dz"

    .prologue
    invoke-direct {p0, p1, p2, p3}, Lnubia/fancydrawable/Matrix4x4;->translate(FFF)Lnubia/fancydrawable/Matrix4x4;

    move-result-object v0

    .local v0, matrix:Lnubia/fancydrawable/Matrix4x4;
    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->preContact(Lnubia/fancydrawable/Matrix4x4;)Z

    const/4 v1, 0x1

    return v1
.end method

.method public set(Lnubia/fancydrawable/Matrix4x4;)V
    .locals 2
    .parameter "matrix"

    .prologue
    if-eqz p1, :cond_0

    const/16 v1, 0x10

    new-array v0, v1, [F

    .local v0, value:[F
    invoke-virtual {p1, v0}, Lnubia/fancydrawable/Matrix4x4;->getValues([F)V

    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->setValues([F)V

    .end local v0           #value:[F
    :cond_0
    return-void
.end method

.method public setCamera(FFFFFFFFFFF)Z
    .locals 2
    .parameter "scaleX"
    .parameter "scaleY"
    .parameter "translateX"
    .parameter "translateY"
    .parameter "nearPlane"
    .parameter "cameraDistance"
    .parameter "cameraUp"
    .parameter "cameraLeft"
    .parameter "cameraTilt"
    .parameter "cameraPan"
    .parameter "cameraRoll"

    .prologue
    invoke-virtual/range {p0 .. p11}, Lnubia/fancydrawable/Matrix4x4;->camera(FFFFFFFFFFF)Lnubia/fancydrawable/Matrix4x4;

    move-result-object v0

    .local v0, matrix:Lnubia/fancydrawable/Matrix4x4;
    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->set(Lnubia/fancydrawable/Matrix4x4;)V

    const/4 v1, 0x1

    return v1
.end method

.method public setRotateX(F)Z
    .locals 2
    .parameter "degree"

    .prologue
    invoke-direct {p0, p1}, Lnubia/fancydrawable/Matrix4x4;->rotateX(F)Lnubia/fancydrawable/Matrix4x4;

    move-result-object v0

    .local v0, matrix:Lnubia/fancydrawable/Matrix4x4;
    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->set(Lnubia/fancydrawable/Matrix4x4;)V

    const/4 v1, 0x1

    return v1
.end method

.method public setRotateY(F)Z
    .locals 2
    .parameter "degree"

    .prologue
    invoke-direct {p0, p1}, Lnubia/fancydrawable/Matrix4x4;->rotateY(F)Lnubia/fancydrawable/Matrix4x4;

    move-result-object v0

    .local v0, matrix:Lnubia/fancydrawable/Matrix4x4;
    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->set(Lnubia/fancydrawable/Matrix4x4;)V

    const/4 v1, 0x1

    return v1
.end method

.method public setRotateZ(F)Z
    .locals 2
    .parameter "degree"

    .prologue
    invoke-direct {p0, p1}, Lnubia/fancydrawable/Matrix4x4;->rotateZ(F)Lnubia/fancydrawable/Matrix4x4;

    move-result-object v0

    .local v0, matrix:Lnubia/fancydrawable/Matrix4x4;
    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->set(Lnubia/fancydrawable/Matrix4x4;)V

    const/4 v1, 0x1

    return v1
.end method

.method public setScale(FFF)Z
    .locals 2
    .parameter "sx"
    .parameter "sy"
    .parameter "sz"

    .prologue
    invoke-direct {p0, p1, p2, p3}, Lnubia/fancydrawable/Matrix4x4;->scale(FFF)Lnubia/fancydrawable/Matrix4x4;

    move-result-object v0

    .local v0, matrix:Lnubia/fancydrawable/Matrix4x4;
    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->set(Lnubia/fancydrawable/Matrix4x4;)V

    const/4 v1, 0x1

    return v1
.end method

.method public setTranslate(FFF)Z
    .locals 2
    .parameter "dx"
    .parameter "dy"
    .parameter "dz"

    .prologue
    invoke-direct {p0, p1, p2, p3}, Lnubia/fancydrawable/Matrix4x4;->translate(FFF)Lnubia/fancydrawable/Matrix4x4;

    move-result-object v0

    .local v0, matrix:Lnubia/fancydrawable/Matrix4x4;
    invoke-virtual {p0, v0}, Lnubia/fancydrawable/Matrix4x4;->set(Lnubia/fancydrawable/Matrix4x4;)V

    const/4 v1, 0x1

    return v1
.end method

.method public setValues([F)V
    .locals 3
    .parameter "value"

    .prologue
    const/4 v0, 0x0

    .local v0, i:I
    :goto_0
    const/16 v1, 0x10

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lnubia/fancydrawable/Matrix4x4;->mValue:[F

    aget v2, p1, v0

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
