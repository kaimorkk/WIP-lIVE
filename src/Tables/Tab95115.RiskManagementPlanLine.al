
table 95115 "Risk Management Plan Line"
{
    DrillDownPageID = "Risk Management Plan Lns";
    LookupPageID = "Risk Management Plan Lns";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(2; "Document No"; Code[20])
        {
        }
        field(3; "Risk ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; "Risk Category"; Code[20])
        {
            TableRelation = "Risk Category".Code;

            trigger OnValidate()
            begin
                RiskCategory.Reset;
                RiskCategory.SetRange(RiskCategory.Code, "Risk Category");
                if RiskCategory.FindSet then begin
                    //"Risk Title":=RiskCategory.Description;
                    "Risk Source ID" := RiskCategory."Risk Source ID";
                    Validate("Risk Source ID");
                end;
            end;
        }
        field(5; "Risk Title"; Text[250])
        {
        }
        field(6; "Risk Source ID"; Code[20])
        {
            Editable = false;
            TableRelation = "Risk Source"."Source ID" where(Blocked = filter(false));

            trigger OnValidate()
            begin
                RiskSource.Reset;
                RiskSource.SetRange(RiskSource."Source ID", "Risk Source ID");
                if RiskSource.FindSet then
                    "Strategic Pillar Description" := RiskSource.Description;
            end;
        }
        field(7; "Risk Likelihood Code"; Code[20])
        {
            TableRelation = "Risk Rating Scale Line".Code where("Risk Rating Scale Type" = filter("Likelihood Rating"));

            trigger OnValidate()
            begin
                RiskRatingScaleLine.Reset;
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Risk Rating Scale Type", RiskRatingScaleLine."risk rating scale type"::"Likelihood Rating");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Rating Scale ID", "Risk Likelihood Rate Scale ID");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine.Code, "Risk Likelihood Code");
                if RiskRatingScaleLine.FindSet then begin
                    "Risk Likelihood Rating" := RiskRatingScaleLine."Actual Rating";
                    //MESSAGE(FORMAT( "Risk Likelihood Rating"));
                    "Risk Likelihood Actual Rating" := 0;
                end;
                //"Overal Risk Rating":="Risk Likelihood Rating"*"Risk Impact Rating";
                //VALIDATE("Overal Risk Rating");

                // RiskRatingScaleLine.RESET;
                // RiskRatingScaleLine.SETCURRENTKEY("Risk Rating Scale Type","Rating Scale ID");
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Risk Rating Scale Type",RiskRatingScaleLine."Risk Rating Scale Type"::"Overall Risk Rating");
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Rating Scale ID","Overall Risk Rating Scale ID");
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
        field(8; "Risk Impact Code"; Code[20])
        {
            TableRelation = "Risk Rating Scale Line".Code where("Risk Rating Scale Type" = filter("Impact Rating"));

            trigger OnValidate()
            begin
                RiskRatingScaleLine.Reset;
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Risk Rating Scale Type", RiskRatingScaleLine."risk rating scale type"::"Impact Rating");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Rating Scale ID", "Risk Impact Rating Scale ID");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine.Code, "Risk Impact Code");
                if RiskRatingScaleLine.FindSet then begin
                    "Risk Impact Rating" := RiskRatingScaleLine."Actual Rating";
                    "Risk Impact Actual Rating" := 0;
                    //MESSAGE(FORMAT( "Risk Impact Rating"));
                end;
                //   "Overal Risk Rating":="Risk Likelihood Rating"*"Risk Impact Rating";
                //   VALIDATE("Overal Risk Rating");
                //
                // RiskRatingScaleLine.RESET;
                // RiskRatingScaleLine.SETCURRENTKEY("Risk Rating Scale Type","Rating Scale ID");
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Risk Rating Scale Type",RiskRatingScaleLine."Risk Rating Scale Type"::"Overall Risk Rating");
                // RiskRatingScaleLine.SETRANGE(RiskRatingScaleLine."Rating Scale ID","Overall Risk Rating Scale ID");
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
        field(9; "Risk Impact Type"; Option)
        {
            OptionCaption = ' ,Negative,Positive';
            OptionMembers = " ",Negative,Positive;
        }
        field(10; "Estimate Fin. Impact (LCY)"; Option)
        {
            Description = 'Estimate Fin. Impact (LCY)';
            OptionCaption = ', 10M - 100M, 1M - 10M, 100K- 1M, 0-100K';
            OptionMembers = ," 10M - 100M"," 1M - 10M"," 100K- 1M"," 0-100K";
        }
        field(11; "Estimate Delay Impact (Days)"; Integer)
        {
        }
        field(12; "Gen. Risk Response Strategy"; Code[20])
        {
            Description = 'Gen. Risk Response Strategy';
            TableRelation = "Risk Response Strategy"."Strategy ID" where("Risk Impact Type" = field("Risk Impact Type"));
        }
        field(13; "Date Raised"; Date)
        {
        }
        field(14; "Risk Status"; Option)
        {
            OptionCaption = ' ,Open,Closed';
            OptionMembers = " ",Open,Closed;
        }
        field(15; "Date Closed"; Date)
        {
        }
        field(16; "Risk Likelihood Rate Scale ID"; Code[20])
        {
            Description = 'Risk Likelihood Rate Scale ID';
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where("Risk Rating Scale Type" = filter("Likelihood Rating"),
                                                                         Blocked = filter(false));
        }
        field(17; "Risk Impact Rating Scale ID"; Code[20])
        {
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where("Risk Rating Scale Type" = filter("Impact Rating"),
                                                                         Blocked = filter(false));
        }
        field(18; "Overall Risk Rating Scale ID"; Code[20])
        {
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where("Risk Rating Scale Type" = filter("Overall Risk Rating"),
                                                                         Blocked = filter(false));
        }
        field(19; "Risk Appetite Rating Scale ID"; Code[20])
        {
            Description = 'Risk Appetite Rating Scale ID';
            TableRelation = "Risk Rating Scale"."Rating Scale ID" where("Risk Rating Scale Type" = filter("Risk Appetite Rating"),
                                                                         Blocked = filter(false));
        }
        field(20; "Risk Likelihood Rating"; Decimal)
        {
            Editable = false;
        }
        field(21; "Risk Impact Rating"; Decimal)
        {
            Editable = false;
        }
        field(22; "Overal Risk Rating"; Decimal)
        {
            Editable = false;
        }
        field(23; "Overall Risk Level Code"; Code[20])
        {
            TableRelation = "Risk Rating Scale Line".Code where("Risk Rating Scale Type" = filter("Overall Risk Rating"));
        }
        field(24; "Risk Heat Zone"; Option)
        {
            OptionCaption = ' ,Red,Yellow,Green';
            OptionMembers = " ",Red,Yellow,Green;
        }
        field(25; "No. of Planed Risk Resp. Actns"; Integer)
        {
            Description = 'No. of Plan Risk Resp. Actns';
        }
        field(26; "No. of Actual Risk Resp. Actns"; Integer)
        {
            Description = 'No. of Actual Risk Resp. Actns';
        }
        field(27; "No. of Impacted Project Tasks"; Integer)
        {
        }
        field(28; "No. of Pos. Risk Incidences"; Integer)
        {
            Description = 'No. of Pos. Risk Incidences';
        }
        field(29; "No. of Neg. Risk Incidences"; Integer)
        {
            Description = 'No. of Neg. Risk Incidences';
        }
        field(30; "Actual Financial Impact (LCY)"; Decimal)
        {
        }
        field(31; "Actual Delay Impact (Days)"; Integer)
        {
        }
        field(32; "New Risk Voucher ID"; Code[20])
        {
        }
        field(33; "Operational (Days)"; Option)
        {
            OptionMembers = ,"Complete loss of service delivery affecting all Institute critical functions","Service lost for period exceeding 1 week","1 - 5 days","1-8hrs ","0-60 minutes ";
        }
        field(34; Reputational; Option)
        {
            OptionMembers = ,"Adverse media coverage for an extended period","Complaints from the public that lead to Prominent negative media coverage as other page article news","Adverse media coverage for 1 day","Slight impact"," may necessitate departmental report on root cause analysis","Trivial impact"," only known to staff close to the incident";
        }
        field(35; "Legal or Compliance"; Option)
        {
            OptionMembers = ,"Legal consequences resulting in prosecution","Internal investigation or by an external source/regulator","Non-compliance that leads to fines","Significant breach of internal policy","Minor breach of internal policy";
        }
        field(36; "Health & Safety"; Option)
        {
            OptionMembers = ,Staff," contractor or visitor involved in a fatal event","Staff contractor or visitor suffers serious injury","Moderate injury equivalent to staff requiring time < 5 days away from work","Minor injury equivalent to staff requiring time < 1 day away from work","Minor injury treated with first aid";
        }
        field(37; "Existing Controls  Measures"; Text[250])
        {
        }
        field(38; "Risk Appetite"; Code[20])
        {
            TableRelation = "Risk Rating Scale Line".Code where("Risk Rating Scale Type" = filter("Risk Appetite Rating"));
        }
        field(39; "Risk Likelihood Actual Rating"; Decimal)
        {
            TableRelation = "Risk Rating Actual Scale"."Actual Rating" where(Code = field("Risk Likelihood Code"));

            trigger OnValidate()
            begin
                RiskRatingScaleLine.Reset;
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Risk Rating Scale Type", RiskRatingScaleLine."risk rating scale type"::"Likelihood Rating");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Rating Scale ID", "Risk Likelihood Rate Scale ID");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine.Code, "Risk Likelihood Code");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Actual Rating", "Risk Likelihood Actual Rating");
                if RiskRatingScaleLine.FindSet then begin
                    "Risk Likelihood Rating" := RiskRatingScaleLine."Actual Rating";
                    //MESSAGE(FORMAT( "Risk Likelihood Rating"));
                end;
                //"Risk Likelihood Rating" := "Risk Likelihood Actual Rating";
                //"Overal Risk Rating":="Risk Likelihood Rating"*"Risk Impact Rating";
                "Overal Risk Rating" := "Risk Impact Actual Rating" * "Risk Likelihood Actual Rating";
                Validate("Overal Risk Rating");

                RiskRatingScaleLine.Reset;
                RiskRatingScaleLine.SetCurrentkey("Risk Rating Scale Type", "Rating Scale ID");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Risk Rating Scale Type", RiskRatingScaleLine."risk rating scale type"::"Overall Risk Rating");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Rating Scale ID", "Overall Risk Rating Scale ID");
                if RiskRatingScaleLine.FindSet then begin
                    repeat
                        if (("Overal Risk Rating" >= RiskRatingScaleLine."Min Overall Rating") and ("Overal Risk Rating" <= RiskRatingScaleLine."Max Overall Rating")) then
                            "Overall Risk Level Code" := RiskRatingScaleLine.Code;
                    until RiskRatingScaleLine.Next = 0;
                end;

                RiskRatingScaleLine.Reset;
                RiskRatingScaleLine.SetCurrentkey("Risk Rating Scale Type", "Rating Scale ID", Code);
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Risk Rating Scale Type", RiskRatingScaleLine."risk rating scale type"::"Overall Risk Rating");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Rating Scale ID", "Overall Risk Rating Scale ID");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine.Code, "Overall Risk Level Code");
                if RiskRatingScaleLine.FindFirst then begin
                    repeat
                        if (("Overal Risk Rating" >= RiskRatingScaleLine."Min Overall Rating") and ("Overal Risk Rating" <= RiskRatingScaleLine."Max Overall Rating")) then begin
                            "Risk Heat Zone" := RiskRatingScaleLine."Risk Heat Zone";
                            //MESSAGE(FORMAT("Risk Heat Zone"));
                        end;
                    until RiskRatingScaleLine.Next = 0;
                end;
            end;
        }
        field(40; "Risk Impact Actual Rating"; Decimal)
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
                "Overal Risk Rating" := "Risk Impact Actual Rating" * "Risk Likelihood Actual Rating";
                Validate("Overal Risk Rating");
                RiskRatingScaleLine.Reset;
                RiskRatingScaleLine.SetCurrentkey("Risk Rating Scale Type", "Rating Scale ID");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Risk Rating Scale Type", RiskRatingScaleLine."risk rating scale type"::"Overall Risk Rating");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Rating Scale ID", "Overall Risk Rating Scale ID");
                if RiskRatingScaleLine.FindSet then begin
                    repeat
                        if (("Overal Risk Rating" >= RiskRatingScaleLine."Min Overall Rating") and ("Overal Risk Rating" <= RiskRatingScaleLine."Max Overall Rating")) then
                            "Overall Risk Level Code" := RiskRatingScaleLine.Code;
                    until RiskRatingScaleLine.Next = 0;
                end;

                RiskRatingScaleLine.Reset;
                RiskRatingScaleLine.SetCurrentkey("Risk Rating Scale Type", "Rating Scale ID", Code);
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Risk Rating Scale Type", RiskRatingScaleLine."risk rating scale type"::"Overall Risk Rating");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine."Rating Scale ID", "Overall Risk Rating Scale ID");
                RiskRatingScaleLine.SetRange(RiskRatingScaleLine.Code, "Overall Risk Level Code");
                if RiskRatingScaleLine.FindFirst then begin
                    repeat
                        if (("Overal Risk Rating" >= RiskRatingScaleLine."Min Overall Rating") and ("Overal Risk Rating" <= RiskRatingScaleLine."Max Overall Rating")) then begin
                            "Risk Heat Zone" := RiskRatingScaleLine."Risk Heat Zone";
                            //MESSAGE(FORMAT("Risk Heat Zone"));
                        end;
                    until RiskRatingScaleLine.Next = 0;
                end;
            end;
        }
        field(41; "Risk Impact Codes"; Code[20])
        {
            TableRelation = "Risk Impacts";

            trigger OnValidate()
            begin
                if RiskImpacts.Get("Risk Impact Codes") then
                    "Risk Impact Description" := RiskImpacts.Description;
            end;
        }
        field(42; "Risk Impact Description"; Text[250])
        {
            Editable = false;
        }
        field(43; "Strategic Pillar Description"; Text[250])
        {
        }
        field(44; "Likelihood Actual Rating"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Risk ID", "Document No", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Risk ID", "Risk Title", "Risk Category")
        {
        }
    }

    trigger OnInsert()
    begin
        "Date Raised" := Today;
        "Risk Status" := "risk status"::Open;
        "Date Raised" := Today;

        RiskManagementPlan.Reset;
        RiskManagementPlan.SetRange("Document No", "Document No");
        RiskManagementPlan.SetRange("Document Type", "Document Type");
        if RiskManagementPlan.FindSet then begin
            "Risk Appetite Rating Scale ID" := RiskManagementPlan."Risk Appetite Rating Scale ID";
            "Risk Likelihood Rate Scale ID" := RiskManagementPlan."Risk Likelihood Rate Scale ID";
            "Overall Risk Rating Scale ID" := RiskManagementPlan."Overall Risk Rating Scale ID";
            "Risk Impact Rating Scale ID" := RiskManagementPlan."Risk Impact Rating Scale ID";
        end;
    end;

    trigger OnModify()
    begin
        Validate("Risk Likelihood Actual Rating");
    end;

    var
        RiskCategory: Record "Risk Category";
        RiskRatingScaleLine: Record "Risk Rating Scale Line";
        RiskManagementPlan: Record "Risk Management Plan";
        RiskImpacts: Record "Risk Impacts";
        RiskSource: Record "Risk Source";
}

