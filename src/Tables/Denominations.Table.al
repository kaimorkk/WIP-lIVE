Table 52193499 Denominations
{
    DrillDownPageID = Denominations;
    LookupPageID = Denominations;

    fields
    {
        field(1;"Code";Code[30])
        {
            NotBlank = true;
            TableRelation = Transactions;
        }
        field(2;"Line No";Integer)
        {
        }
        field(3;"Currency Code";Code[30])
        {
            TableRelation = Currency;

            trigger OnValidate()
            begin
                /*IF Currx.GET("Currency Code") THEN BEGIN
                Description:=Currx.Description;
                TenNote:=FIELDCAPTION("10")+' '+"Currency Code"+' '+ NoteLbl;
                TwentyNote:=FIELDCAPTION("20")+' '+"Currency Code"+' '+ NoteLbl;
                FiftyNote:=FIELDCAPTION("50")+' '+"Currency Code"+' '+ NoteLbl;
                HundredNote:=FIELDCAPTION("100")+' '+"Currency Code"+' '+ NoteLbl;
                TwoHundredNote:=FIELDCAPTION("200")+' '+"Currency Code"+' '+ NoteLbl;
                FiveHundredNote:=FIELDCAPTION("500")+' '+"Currency Code"+' '+ NoteLbl;
                ThousandNote:=FIELDCAPTION("1000")+' '+"Currency Code"+' '+ NoteLbl;
                
                FiveCent:=FIELDCAPTION("5")+' '+"Currency Code"+' '+ CentsLbl;
                TenCent:='10'+' '+"Currency Code"+' '+ CentsLbl;
                TwentyCent:='20'+' '+"Currency Code"+' '+ CentsLbl;
                FiftyCent:='50'+' '+"Currency Code"+' '+ CentsLbl;
                OneCent:=FIELDCAPTION("1")+' '+"Currency Code"+' '+ CentLbl;
                TwoCent:=FIELDCAPTION("2")+' '+"Currency Code"+' '+ CentsLbl;
                One:=FIELDCAPTION("1")+' '+"Currency Code";
                Two:=FIELDCAPTION("2")+' '+"Currency Code";
                Five:=FIELDCAPTION("5")+' '+"Currency Code";
                END;*/

            end;
        }
        field(4;Description;Text[30])
        {
        }
        field(161;"10";Integer)
        {
            CaptionClass = TenNote;

            trigger OnValidate()
            begin
                //******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
            end;
        }
        field(162;"20";Integer)
        {
            CaptionClass = TwentyNote;

            trigger OnValidate()
            begin
                //******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
            end;
        }
        field(163;"50";Integer)
        {
            CaptionClass = FiftyNote;

            trigger OnValidate()
            begin
                //******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
            end;
        }
        field(164;"100";Integer)
        {
            CaptionClass = HundredNote;

            trigger OnValidate()
            begin
                //******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
            end;
        }
        field(165;"200";Integer)
        {
            CaptionClass = TwoHundredNote;

            trigger OnValidate()
            begin
                //******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
            end;
        }
        field(166;"1000";Integer)
        {
            CaptionClass = ThousandNote;

            trigger OnValidate()
            begin
                //******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
            end;
        }
        field(167;"5c";Integer)
        {
            CaptionClass = FiveCent;
            Caption = '5c';

            trigger OnValidate()
            begin
                //******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
            end;
        }
        field(168;"10c";Integer)
        {
            CaptionClass = TenCent;
            Caption = '10';

            trigger OnValidate()
            begin
                //******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
            end;
        }
        field(169;"20c";Integer)
        {
            CaptionClass = TwentyCent;
            Caption = '20';

            trigger OnValidate()
            begin
                //******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
            end;
        }
        field(170;"50c";Integer)
        {
            CaptionClass = FiftyCent;
            Caption = '50';

            trigger OnValidate()
            begin
                //******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
            end;
        }
        field(171;"1";Integer)
        {
            CaptionClass = One;

            trigger OnValidate()
            begin
                //******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
            end;
        }
        field(172;"2";Integer)
        {
            CaptionClass = Two;

            trigger OnValidate()
            begin
                //******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
            end;
        }
        field(173;"5";Integer)
        {
            CaptionClass = Five;

            trigger OnValidate()
            begin
                //******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
            end;
        }
        field(186;"1c";Integer)
        {
            CaptionClass = OneCent;
            Caption = '1';

            trigger OnValidate()
            begin
                //******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
            end;
        }
        field(187;"2c";Integer)
        {
            CaptionClass = TwoCent;
            Caption = '2';

            trigger OnValidate()
            begin
                //******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
            end;
        }
        field(188;"500";Integer)
        {
            CaptionClass = FiveHundredNote;

            trigger OnValidate()
            begin
                //******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //******
            end;
        }
        field(189;Totals;Decimal)
        {
            Editable = false;

            trigger OnValidate()
            begin
                /*//******Calculation of Denominational totals code
                FosaCurrMngt."Denominational Totals"(Rec);
                //*******/

            end;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        FosaCurrMngt: Codeunit "Fosa Currency Management";
        cd: Text;
        Currx: Record Currency;
        den: Record Denominations;
        Found: Boolean;
        TenNote: Text;
        NoteLbl: label 'Notes';
        CentsLbl: label 'Cents';
        CentLbl: label 'Cent';
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
}

