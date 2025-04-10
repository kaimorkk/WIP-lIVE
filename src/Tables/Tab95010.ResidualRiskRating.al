
table 95010 "Residual Risk Rating"
{
    DrillDownPageID = "Risk Management Plan Lines";
    LookupPageID = "Risk Management Plan Lines";
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
            Editable = false;

            trigger OnValidate()
            begin
                RiskManagementPlanLines.Reset;
                RiskManagementPlanLines.SetRange("Risk ID", "Risk ID");
                if RiskManagementPlanLines.FindSet then begin
                    "Risk ID" := RiskManagementPlanLines."Risk ID";
                    "Risk Title" := RiskManagementPlanLines."Risk Title";
                end;
            end;
        }
        field(4; "Risk Category"; Code[20])
        {
            TableRelation = "Risk Category".Code;

            trigger OnValidate()
            begin
                RiskCategory.Reset;
                RiskCategory.SetRange(RiskCategory.Code, "Risk Category");
                if RiskCategory.FindSet then begin
                    "Risk Title" := RiskCategory.Description;
                    "Risk Source ID" := RiskCategory."Risk Source ID";
                    Validate("Risk Source ID");
                end;
            end;
        }
        field(5; "Risk Title"; Text[440])
        {
            Editable = false;
        }
        field(6; "Risk Source ID"; Code[20])
        {
            Editable = false;
            TableRelation = "Risk Source"."Source ID" where(Blocked = filter(false));
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
                    "Risk Likelihood Rating" := RiskRatingScaleLine."Rating Score";
                    //MESSAGE(FORMAT( "Risk Likelihood Rating"));
                end;
                "Overal Risk Rating" := "Risk Likelihood Rating" * "Risk Impact Rating";
                //VALIDATE("Overal Risk Rating");


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
                        end;
                    until RiskRatingScaleLine.Next = 0;
                end;
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
                    "Risk Impact Rating" := RiskRatingScaleLine."Rating Score";
                    // MESSAGE(FORMAT( "Risk Impact Rating"));
                end;
                "Overal Risk Rating" := "Risk Likelihood Rating" * "Risk Impact Rating";
                //VALIDATE("Overal Risk Rating");

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
                            //      MESSAGE(FORMAT("Risk Heat Zone"));
                        end;
                    until RiskRatingScaleLine.Next = 0;
                end;
            end;
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
        field(25; "Residual Risk"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", "Risk ID")
        {
            Clustered = true;
        }
        key(Key2; "Overal Risk Rating")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //"Date Raised":=TODAY;
        //"Risk Status":="Risk Status"::Open;
        //"Date Raised":=TODAY;

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

    var
        RiskCategory: Record "Risk Category";
        RiskRatingScaleLine: Record "Risk Rating Scale Line";
        RiskManagementPlan: Record "Risk Management Plan";
        RiskManagementPlanLines: Record "Risk Management Plan Line";
}

