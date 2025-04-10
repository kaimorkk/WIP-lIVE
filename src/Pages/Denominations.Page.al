Page 52193540 Denominations
{
    AutoSplitKey = true;
    PageType = CardPart;
    SourceTable = Denominations;

    layout
    {
        area(content)
        {
            group(Currency)
            {
                field(CurrencyCode;"Currency Code")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin

                        if Curr.Get("Currency Code") then begin
                        Description:=Curr.Description;
                        TenNote:=FieldCaption("10")+' '+"Currency Code"+' '+ NoteLbl;
                        TwentyNote:=FieldCaption("20")+' '+"Currency Code"+' '+ NoteLbl;
                        FiftyNote:=FieldCaption("50")+' '+"Currency Code"+' '+ NoteLbl;
                        HundredNote:=FieldCaption("100")+' '+"Currency Code"+' '+ NoteLbl;
                        TwoHundredNote:=FieldCaption("200")+' '+"Currency Code"+' '+ NoteLbl;
                        FiveHundredNote:=FieldCaption("500")+' '+"Currency Code"+' '+ NoteLbl;
                        ThousandNote:=FieldCaption("1000")+' '+"Currency Code"+' '+ NoteLbl;

                        FiveCent:=FieldCaption("5")+' '+"Currency Code"+' '+ CentsLbl;
                        TenCent:='10'+' '+"Currency Code"+' '+ CentsLbl;
                        TwentyCent:='20'+' '+"Currency Code"+' '+ CentsLbl;
                        FiftyCent:='50'+' '+"Currency Code"+' '+ CentsLbl;
                        OneCent:=FieldCaption("1")+' '+"Currency Code"+' '+ CentLbl;
                        TwoCent:=FieldCaption("2")+' '+"Currency Code"+' '+ CentsLbl;
                        One:=FieldCaption("1")+' '+"Currency Code";
                        Two:=FieldCaption("2")+' '+"Currency Code";
                        Five:=FieldCaption("5")+' '+"Currency Code";
                        end;
                    end;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Totals;Totals)
                {
                    ApplicationArea = Basic;
                }
            }
            group(Notes)
            {
                Caption = 'Notes';
                field("10";"10")
                {
                    ApplicationArea = Basic;
                    CaptionClass = TenNote;
                }
                field("20";"20")
                {
                    ApplicationArea = Basic;
                    CaptionClass = TwentyNote;
                }
                field("50";"50")
                {
                    ApplicationArea = Basic;
                    CaptionClass = FiftyNote;
                }
                field("100";"100")
                {
                    ApplicationArea = Basic;
                    CaptionClass = HundredNote;
                }
                field("200";"200")
                {
                    ApplicationArea = Basic;
                    CaptionClass = TwoHundredNote;
                }
                field("500";"500")
                {
                    ApplicationArea = Basic;
                    CaptionClass = FiveHundredNote;
                }
                field("1000";"1000")
                {
                    ApplicationArea = Basic;
                    CaptionClass = ThousandNote;
                }
            }
            group(Coins)
            {
                Caption = 'Coins';
                field("1";"1")
                {
                    ApplicationArea = Basic;
                    CaptionClass = One;
                    Visible = CoinsVisible;
                }
                field("2";"2")
                {
                    ApplicationArea = Basic;
                    CaptionClass = Two;
                }
                field("5";"5")
                {
                    ApplicationArea = Basic;
                    CaptionClass = Five;
                }
                field("1c";"1c")
                {
                    ApplicationArea = Basic;
                    CaptionClass = OneCent;
                }
                field("2c";"2c")
                {
                    ApplicationArea = Basic;
                    CaptionClass = TwoCent;
                }
                field("5c";"5c")
                {
                    ApplicationArea = Basic;
                    CaptionClass = FiveCent;
                }
                field("10c";"10c")
                {
                    ApplicationArea = Basic;
                    CaptionClass = TenCent;
                }
                field("20c";"20c")
                {
                    ApplicationArea = Basic;
                    CaptionClass = TwentyCent;
                }
                field("50c";"50c")
                {
                    ApplicationArea = Basic;
                    CaptionClass = FiftyCent;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        /*"Currency Code") THEN BEGIN
        CoinsVisible:=TRUE;
        NotesVisible:=TRUE;
        END;
        */
        
        if Curr.Get("Currency Code") then begin
        Description:=Curr.Description;
        TenNote:=FieldCaption("10")+' '+"Currency Code"+' '+ NoteLbl;
        TwentyNote:=FieldCaption("20")+' '+"Currency Code"+' '+ NoteLbl;
        FiftyNote:=FieldCaption("50")+' '+"Currency Code"+' '+ NoteLbl;
        HundredNote:=FieldCaption("100")+' '+"Currency Code"+' '+ NoteLbl;
        TwoHundredNote:=FieldCaption("200")+' '+"Currency Code"+' '+ NoteLbl;
        FiveHundredNote:=FieldCaption("500")+' '+"Currency Code"+' '+ NoteLbl;
        ThousandNote:=FieldCaption("1000")+' '+"Currency Code"+' '+ NoteLbl;
        
        FiveCent:=FieldCaption("5")+' '+"Currency Code"+' '+ CentsLbl;
        TenCent:='10'+' '+"Currency Code"+' '+ CentsLbl;
        TwentyCent:='20'+' '+"Currency Code"+' '+ CentsLbl;
        FiftyCent:='50'+' '+"Currency Code"+' '+ CentsLbl;
        OneCent:=FieldCaption("1")+' '+"Currency Code"+' '+ CentLbl;
        TwoCent:=FieldCaption("2")+' '+"Currency Code"+' '+ CentsLbl;
        One:=FieldCaption("1")+' '+"Currency Code";
        Two:=FieldCaption("2")+' '+"Currency Code";
        Five:=FieldCaption("5")+' '+"Currency Code";
        end;

    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        /*CoinsVisible:=FALSE;
        NotesVisible:=FALSE;
        */

    end;

    trigger OnModifyRecord(): Boolean
    begin
        Validate("Currency Code");
    end;

    trigger OnOpenPage()
    begin
        Validate("Currency Code");
    end;

    var
        Curr: Record Currency;
        Ntt: Text;
        Trans: Record Transactions;
        CoinsVisible: Boolean;
        TenNVisible: Boolean;
        TwentyNVisible: Boolean;
        FiftyNVisible: Boolean;
        HundredNVisible: Boolean;
        TwoHundredNVisible: Boolean;
        FiveHundredNVisible: Boolean;
        ThousanHundredNVisible: Boolean;
        TenNote: Text;
        TwentyNote: Text;
        FiftyNote: Text;
        HundredNote: Text;
        TwoHundredNote: Text;
        FiveHundredNote: Text;
        ThousandNote: Text;
        FiveCent: Text;
        TenCent: Text;
        TwentyCent: Text;
        FiftyCent: Text;
        One: Text;
        Two: Text;
        Five: Text;
        OneCent: Text;
        TwoCent: Text;
        NoteLbl: label 'Notes';
        CentsLbl: label 'Cents';
        CentLbl: label 'Cent';
}

