.class public Lcom/vzw/nfc/dos/ClfFilterDo;
.super Lcom/vzw/nfc/dos/VzwTlv;
.source "ClfFilterDo.java"


# static fields
.field public static final _TAG:I = 0xfe


# instance fields
.field private mFilterEntryAr:Lcom/vzw/nfc/dos/FilterEntryDo;


# direct methods
.method public constructor <init>(Lcom/vzw/nfc/dos/FilterEntryDo;)V
    .locals 3
    .parameter "filter_entry_do"

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    const/16 v0, 0xfe

    invoke-direct {p0, v2, v0, v1, v1}, Lcom/vzw/nfc/dos/VzwTlv;-><init>([BIII)V

    iput-object v2, p0, Lcom/vzw/nfc/dos/ClfFilterDo;->mFilterEntryAr:Lcom/vzw/nfc/dos/FilterEntryDo;

    iput-object p1, p0, Lcom/vzw/nfc/dos/ClfFilterDo;->mFilterEntryAr:Lcom/vzw/nfc/dos/FilterEntryDo;

    return-void
.end method

.method public constructor <init>([BII)V
    .locals 1
    .parameter "rawData"
    .parameter "valueIndex"
    .parameter "valueLength"

    .prologue
    const/16 v0, 0xfe

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/vzw/nfc/dos/VzwTlv;-><init>([BIII)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vzw/nfc/dos/ClfFilterDo;->mFilterEntryAr:Lcom/vzw/nfc/dos/FilterEntryDo;

    return-void
.end method


# virtual methods
.method public getFilterEntryDo()Lcom/vzw/nfc/dos/FilterEntryDo;
    .locals 1

    .prologue
    iget-object v0, p0, Lcom/vzw/nfc/dos/ClfFilterDo;->mFilterEntryAr:Lcom/vzw/nfc/dos/FilterEntryDo;

    return-object v0
.end method

.method public translate()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/vzw/nfc/dos/DoParserException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/vzw/nfc/dos/ClfFilterDo;->mFilterEntryAr:Lcom/vzw/nfc/dos/FilterEntryDo;

    invoke-virtual {p0}, Lcom/vzw/nfc/dos/ClfFilterDo;->getRawData()[B

    move-result-object v0

    .local v0, data:[B
    invoke-virtual {p0}, Lcom/vzw/nfc/dos/ClfFilterDo;->getValueIndex()I

    move-result v1

    .local v1, index:I
    invoke-virtual {p0}, Lcom/vzw/nfc/dos/ClfFilterDo;->getValueLength()I

    move-result v3

    add-int/2addr v3, v1

    array-length v4, v0

    if-le v3, v4, :cond_0

    new-instance v3, Lcom/vzw/nfc/dos/DoParserException;

    const-string v4, "Not enough data for CLF_FILTER_DO!"

    invoke-direct {v3, v4}, Lcom/vzw/nfc/dos/DoParserException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_0
    invoke-static {v0, v1}, Lcom/vzw/nfc/dos/VzwTlv;->parse([BI)Lcom/vzw/nfc/dos/VzwTlv;

    move-result-object v2

    .local v2, temp:Lcom/vzw/nfc/dos/VzwTlv;
    invoke-virtual {v2}, Lcom/vzw/nfc/dos/VzwTlv;->getTag()I

    move-result v3

    const/16 v4, 0xa1

    if-ne v3, v4, :cond_1

    new-instance v3, Lcom/vzw/nfc/dos/FilterEntryDo;

    invoke-virtual {v2}, Lcom/vzw/nfc/dos/VzwTlv;->getValueIndex()I

    move-result v4

    invoke-virtual {v2}, Lcom/vzw/nfc/dos/VzwTlv;->getValueLength()I

    move-result v5

    invoke-direct {v3, v0, v4, v5}, Lcom/vzw/nfc/dos/FilterEntryDo;-><init>([BII)V

    iput-object v3, p0, Lcom/vzw/nfc/dos/ClfFilterDo;->mFilterEntryAr:Lcom/vzw/nfc/dos/FilterEntryDo;

    iget-object v3, p0, Lcom/vzw/nfc/dos/ClfFilterDo;->mFilterEntryAr:Lcom/vzw/nfc/dos/FilterEntryDo;

    invoke-virtual {v3}, Lcom/vzw/nfc/dos/FilterEntryDo;->translate()V

    invoke-virtual {v2}, Lcom/vzw/nfc/dos/VzwTlv;->getValueIndex()I

    move-result v3

    invoke-virtual {v2}, Lcom/vzw/nfc/dos/VzwTlv;->getValueLength()I

    move-result v4

    add-int v1, v3, v4

    invoke-virtual {p0}, Lcom/vzw/nfc/dos/ClfFilterDo;->getValueIndex()I

    move-result v3

    invoke-virtual {p0}, Lcom/vzw/nfc/dos/ClfFilterDo;->getValueLength()I

    move-result v4

    add-int/2addr v3, v4

    if-gt v3, v1, :cond_0

    iget-object v3, p0, Lcom/vzw/nfc/dos/ClfFilterDo;->mFilterEntryAr:Lcom/vzw/nfc/dos/FilterEntryDo;

    if-nez v3, :cond_2

    new-instance v3, Lcom/vzw/nfc/dos/DoParserException;

    const-string v4, "Invalid FILTER_ENTRY_DO in CLF_FILTER_DO!"

    invoke-direct {v3, v4}, Lcom/vzw/nfc/dos/DoParserException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_1
    new-instance v3, Lcom/vzw/nfc/dos/DoParserException;

    const-string v4, "Invalid FILTER_ENTRY_DO in CLF_FILTER_DO!"

    invoke-direct {v3, v4}, Lcom/vzw/nfc/dos/DoParserException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_2
    return-void
.end method
