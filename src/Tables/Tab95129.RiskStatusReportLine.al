
table 95129 "Risk Status Report Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ' ,New Risk Voucher,Risk Status Report';
            OptionMembers = " ","New Risk Voucher","Risk Status Report";
        }
        field(2; "Document No"; Code[20])
        {
        }
        field(3; "Risk Management Plan ID"; Code[20])
        {
        }
        field(4; "Risk ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(5; "Risk Title"; Text[2048])
        {
        }
        field(6; "Risk Likelihood Code"; Code[20])
        {
        }
        field(7; "Risk Impact Code"; Code[20])
        {
        }
        field(8; "Risk Impact Type"; Option)
        {
            OptionCaption = ' ,Negative,Positive';
            OptionMembers = " ",Negative,Positive;
        }
        field(9; "Estimate Fin. Impact (LCY)"; Decimal)
        {
            Description = 'Estimate Fin. Impact (LCY)';
        }
        field(10; "Estimate Delay Impact (Days)"; Integer)
        {
        }
        field(11; "Gen. Risk Response Strategy"; Code[20])
        {
            Description = 'Gen. Risk Response Strategy';
        }
        field(12; "Risk Status"; Option)
        {
            OptionCaption = ' ,Open,Closed';
            OptionMembers = " ",Open,Closed;
        }
        field(13; "Date Closed"; Date)
        {
        }
        field(14; "Risk Likelihood Rate Scale ID"; Code[20])
        {
            Description = 'Risk Likelihood Rate Scale ID';
        }
        field(15; "Risk Impact Rating Scale ID"; Code[20])
        {
        }
        field(16; "Overall Risk Rating Scale ID"; Code[20])
        {
        }
        field(17; "Risk Appetite Rating Scale ID"; Code[20])
        {
            Description = 'Risk Appetite Rating Scale ID';
        }
        field(18; "Risk Likelihood Rating"; Decimal)
        {
        }
        field(19; "Risk Impact Rating"; Decimal)
        {
        }
        field(20; "Overal Risk Rating"; Decimal)
        {
        }
        field(21; "Overall Risk Level Code"; Code[20])
        {
        }
        field(22; "Risk Heat Zone"; Option)
        {
            OptionCaption = ' ,Red,Yellow,Green';
            OptionMembers = " ",Red,Yellow,Green;
        }
        field(23; "No. of Actual Risk Resp. Actns"; Integer)
        {
            Description = 'No. of Actual Risk Resp. Actns';
        }
        field(24; "Risk Register Type"; Option)
        {
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(25; "Risk Likelihood Actual Rating"; Decimal)
        {
            TableRelation = "Risk Rating Actual Scale"."Actual Rating" where(Code = field("Risk Likelihood Code"));

            trigger OnValidate()
            begin
                // RiskRatingScaleLine.RESET;
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Risk Rating Scale Type",RiskRatingScaleLine."Risk Rating Scale Type"::"Likelihood Rating");
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Rating Scale ID","Risk Likelihood Rate Scale ID");
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine.Code,"Risk Likelihood Code");
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Actual Rating","Risk Likelihood Actual Rating");
                // IF RiskRatingScaleLine.FINDSET THEN BEGIN
                //  "Risk Likelihood Rating":=RiskRatingScaleLine."Actual Rating";
                //MESSAGE(FORMAT( "Risk Likelihood Rating"));
                // END;
                // "Risk Likelihood Rating" := "Risk Likelihood Actual Rating";
                // "Overal Risk Rating":="Risk Likelihood Rating"*"Risk Impact Rating";
                // "Overal Risk Rating":= "Risk Impact Actual Rating" * "Risk Likelihood Actual Rating";
                // VALIDATE("Overal Risk Rating");
                //
                // RiskRatingScaleLine.RESET;
                // RiskRatingScaleLine.SETCURRENTKEY("Risk Rating Scale Type","Rating Scale ID");
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Risk Rating Scale Type",RiskRatingScaleLine."Risk Rating Scale Type"::"Overall Risk Rating");
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Rating Scale ID","Overall Risk Rating Scale ID");
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Actual Rating","Risk Likelihood Actual Rating");
                // IF RiskRatingScaleLine.FINDSET THEN BEGIN
                //  REPEAT
                //    IF (("Overal Risk Rating">=RiskRatingScaleLine."Min Overall Rating") AND ("Overal Risk Rating"<=RiskRatingScaleLine."Max Overall Rating")) THEN
                //       "Overall Risk Level Code":=RiskRatingScaleLine.Code;
                //    UNTIL RiskRatingScaleLine.NEXT=0;
                // END;
                //
                // RiskRatingScaleLine.RESET;
                // RiskRatingScaleLine.SETCURRENTKEY("Risk Rating Scale Type","Rating Scale ID",Code);
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Risk Rating Scale Type",RiskRatingScaleLine."Risk Rating Scale Type"::"Overall Risk Rating");
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Rating Scale ID","Overall Risk Rating Scale ID");
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine.Code,"Overall Risk Level Code");
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Actual Rating","Risk Likelihood Actual Rating");
                // IF RiskRatingScaleLine.FINDFIRST THEN
                //  BEGIN
                //    REPEAT
                //      IF (("Overal Risk Rating">=RiskRatingScaleLine."Min Overall Rating") AND ("Overal Risk Rating"<=RiskRatingScaleLine."Max Overall Rating")) THEN BEGIN
                //        "Risk Heat Zone":=RiskRatingScaleLine."Risk Heat Zone";
                //       END;
                //      UNTIL RiskRatingScaleLine.NEXT=0;
                //  END;
            end;
        }
        field(26; "Risk Impact Actual Rating"; Decimal)
        {
            TableRelation = "Risk Rating Actual Scale"."Actual Rating" where(Code = field("Risk Impact Code"));

            trigger OnValidate()
            begin
                // RiskRatingScaleLine.RESET;
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Risk Rating Scale Type",RiskRatingScaleLine."Risk Rating Scale Type"::"Impact Rating");
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Rating Scale ID","Risk Impact Rating Scale ID");
                //  RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine.Code,"Risk Impact Code");
                //  RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Actual Rating","Risk Impact Actual Rating");
                // IF RiskRatingScaleLine.FINDSET THEN BEGIN
                //  "Risk Impact Rating":=RiskRatingScaleLine."Actual Rating";
                //   //MESSAGE(FORMAT( "Risk Impact Rating"));
                //   END;
                //   "Risk Impact Rating" := "Risk Impact Actual Rating";
                //   "Overal Risk Rating":= "Risk Impact Actual Rating" * "Risk Likelihood Actual Rating";
                //   VALIDATE("Overal Risk Rating");
                //
                // RiskRatingScaleLine.RESET;
                // RiskRatingScaleLine.SETCURRENTKEY("Risk Rating Scale Type","Rating Scale ID");
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Risk Rating Scale Type",RiskRatingScaleLine."Risk Rating Scale Type"::"Overall Risk Rating");
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Rating Scale ID","Overall Risk Rating Scale ID");
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Actual Rating","Risk Impact Actual Rating");
                // IF RiskRatingScaleLine.FINDSET THEN
                //  BEGIN
                //    REPEAT
                //      IF (("Overal Risk Rating">=RiskRatingScaleLine."Min Overall Rating") AND ("Overal Risk Rating"<=RiskRatingScaleLine."Max Overall Rating")) THEN
                //        "Overall Risk Level Code":=RiskRatingScaleLine.Code;
                //       UNTIL RiskRatingScaleLine.NEXT=0;
                //  END;
                //
                // RiskRatingScaleLine.RESET;
                // RiskRatingScaleLine.SETCURRENTKEY("Risk Rating Scale Type","Rating Scale ID",Code);
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Risk Rating Scale Type",RiskRatingScaleLine."Risk Rating Scale Type"::"Overall Risk Rating");
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Rating Scale ID","Overall Risk Rating Scale ID");
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine.Code,"Overall Risk Level Code");
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Actual Rating","Risk Impact Actual Rating");
                // IF RiskRatingScaleLine.FINDFIRST THEN
                //  BEGIN
                //    REPEAT
                //      IF (("Overal Risk Rating">=RiskRatingScaleLine."Min Overall Rating") AND ("Overal Risk Rating"<=RiskRatingScaleLine."Max Overall Rating")) THEN BEGIN
                //        "Risk Heat Zone":=RiskRatingScaleLine."Risk Heat Zone";
                //      //MESSAGE(FORMAT("Risk Heat Zone"));
                //      END;
                //      UNTIL RiskRatingScaleLine.NEXT=0;
                //  END;
            end;
        }
        field(27; "Risk Impact Codes"; Code[20])
        {
            TableRelation = "Risk Impacts";

            trigger OnValidate()
            begin
                // IF RiskImpacts.GET("Risk Impact Codes") THEN
                //  "Risk Impact Description" := RiskImpacts.Description;
            end;
        }
        field(28; "Risk Impact Description"; Text[250])
        {
            Editable = false;
        }
        field(29; "Strategic Pillar Description"; Text[250])
        {
        }
        field(30; "Risk Source ID"; Code[20])
        {
            TableRelation = "Risk Source"."Source ID";

            trigger OnValidate()
            begin
                RiskSource.Reset;
                RiskSource.SetRange(RiskSource."Source ID", "Risk Source ID");
                if RiskSource.FindSet then
                    "Strategic Pillar Description" := RiskSource.Description;
            end;
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Risk Register Type", "Risk Management Plan ID", "Risk ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RiskCategory: Record "Risk Category";
        RiskRatingScaleLine: Record "Risk Rating Scale Line";
        RiskManagementPlan: Record "Risk Management Plan";
        RiskImpacts: Record "Risk Impacts";
        RiskSource: Record "Risk Source";
}

