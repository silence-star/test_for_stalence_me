.class Landroid/content/res/SimulateNinePngUtil$NinePathInputStream;
.super Ljava/io/InputStream;
.source "SimulateNinePngUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/content/res/SimulateNinePngUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NinePathInputStream"
.end annotation


# instance fields
.field private mCount:I

.field private mExtraHeaderData:[B

.field private mInputStream:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;[B)V
    .locals 1
    .parameter "inputstream"
    .parameter "data"

    .prologue
    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    iput v0, p0, Landroid/content/res/SimulateNinePngUtil$NinePathInputStream;->mCount:I

    iput-object p1, p0, Landroid/content/res/SimulateNinePngUtil$NinePathInputStream;->mInputStream:Ljava/io/InputStream;

    iput-object p2, p0, Landroid/content/res/SimulateNinePngUtil$NinePathInputStream;->mExtraHeaderData:[B

    iput v0, p0, Landroid/content/res/SimulateNinePngUtil$NinePathInputStream;->mCount:I

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    iget-object v0, p0, Landroid/content/res/SimulateNinePngUtil$NinePathInputStream;->mInputStream:Ljava/io/InputStream;

    if-eqz v0, :cond_0

    iget-object v0, p0, Landroid/content/res/SimulateNinePngUtil$NinePathInputStream;->mInputStream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    :cond_0
    return-void
.end method

.method public read()I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    iget v2, p0, Landroid/content/res/SimulateNinePngUtil$NinePathInputStream;->mCount:I

    iget-object v3, p0, Landroid/content/res/SimulateNinePngUtil$NinePathInputStream;->mExtraHeaderData:[B

    array-length v3, v3

    if-ge v2, v3, :cond_0

    iget-object v0, p0, Landroid/content/res/SimulateNinePngUtil$NinePathInputStream;->mExtraHeaderData:[B

    .local v0, arrayOfByte:[B
    iget v1, p0, Landroid/content/res/SimulateNinePngUtil$NinePathInputStream;->mCount:I

    .local v1, i:I
    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Landroid/content/res/SimulateNinePngUtil$NinePathInputStream;->mCount:I

    aget-byte v2, v0, v1

    .end local v0           #arrayOfByte:[B
    .end local v1           #i:I
    :goto_0
    return v2

    :cond_0
    iget-object v2, p0, Landroid/content/res/SimulateNinePngUtil$NinePathInputStream;->mInputStream:Ljava/io/InputStream;

    invoke-virtual {v2}, Ljava/io/InputStream;->read()I

    move-result v2

    goto :goto_0
.end method

.method public read([BII)I
    .locals 8
    .parameter "paramArrayOfByte"
    .parameter "paramInt1"
    .parameter "paramInt2"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    array-length v5, p1

    invoke-static {v5, p2, p3}, Ljava/util/Arrays;->checkOffsetAndCount(III)V

    const/4 v3, 0x0

    .local v3, k:I
    :goto_0
    iget v5, p0, Landroid/content/res/SimulateNinePngUtil$NinePathInputStream;->mCount:I

    iget-object v6, p0, Landroid/content/res/SimulateNinePngUtil$NinePathInputStream;->mExtraHeaderData:[B

    array-length v6, v6

    if-ge v5, v6, :cond_0

    if-ge v3, p3, :cond_0

    add-int/lit8 v4, v3, 0x1

    .local v4, l:I
    add-int v1, p2, v3

    .local v1, i1:I
    iget-object v0, p0, Landroid/content/res/SimulateNinePngUtil$NinePathInputStream;->mExtraHeaderData:[B

    .local v0, abyte1:[B
    iget v2, p0, Landroid/content/res/SimulateNinePngUtil$NinePathInputStream;->mCount:I

    .local v2, j1:I
    add-int/lit8 v5, v2, 0x1

    iput v5, p0, Landroid/content/res/SimulateNinePngUtil$NinePathInputStream;->mCount:I

    aget-byte v5, v0, v2

    aput-byte v5, p1, v1

    move v3, v4

    goto :goto_0

    .end local v0           #abyte1:[B
    .end local v1           #i1:I
    .end local v2           #j1:I
    .end local v4           #l:I
    :cond_0
    if-ge v3, p3, :cond_1

    iget-object v5, p0, Landroid/content/res/SimulateNinePngUtil$NinePathInputStream;->mInputStream:Ljava/io/InputStream;

    add-int v6, p2, v3

    sub-int v7, p3, v3

    invoke-virtual {v5, p1, v6, v7}, Ljava/io/InputStream;->read([BII)I

    move-result v5

    add-int/2addr v3, v5

    :cond_1
    return v3
.end method
