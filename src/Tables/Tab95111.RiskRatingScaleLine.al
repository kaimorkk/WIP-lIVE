
table 95111 "Risk Rating Scale Line"
{
    DrillDownPageID = "Risk Likeli Rating Scale Lines";
    LookupPageID = "Risk Likeli Rating Scale Lines";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Risk Rating Scale Type"; Option)
        {
            OptionCaption = ' ,Likelihood Rating,Impact Rating,Overall Risk Rating,Risk Appetite Rating';
            OptionMembers = " ","Likelihood Rating","Impact Rating","Overall Risk Rating","Risk Appetite Rating";
        }
        field(2; "Rating Scale ID"; Code[20])
        {
        }
        field(3; "Code"; Code[20])
        {
        }
        field(4; Description; Text[250])
        {
        }
        field(5; "Min Probability Percentage"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(6; "Max Probability Percentage"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(7; "No. of Criteria"; Integer)
        {
            CalcFormula = count("Risk Rating Criteria" where("Risk Rating Scale Type" = field("Risk Rating Scale Type"),
                                                              "Rating Scale ID" = field("Rating Scale ID"),
                                                              Code = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8; "Rating Score"; Decimal)
        {
        }
        field(9; "Min Overall Rating"; Decimal)
        {
        }
        field(10; "Max Overall Rating"; Decimal)
        {
        }
        field(11; "Default Risk Response Strategy"; Code[20])
        {
            TableRelation = "Risk Response Strategy"."Strategy ID" where(Blocked = filter(false));
        }
        field(12; "Risk Heat Zone"; Option)
        {
            OptionCaption = ' ,Red,Yellow,Green';
            OptionMembers = " ",Red,Yellow,Green;
        }
        field(13; "No. of Risk Response Actions"; Integer)
        {
            CalcFormula = count("Overal Risk Response Action" where("Risk Rating Scale Type" = field("Risk Rating Scale Type"),
                                                                     "Rating Scale ID" = field("Rating Scale ID"),
                                                                     Code = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; "Risk Taking Philosophy"; Option)
        {
            OptionCaption = ' ,Will take justified risks,Will take strong justified risks,Preference for safe delivery,Extremely conservative,Sacred (risk avoidance is a core objective)';
            OptionMembers = " ","Will take justified risks","Will take strong justified risks","Preference for safe delivery","Extremely conservative","Sacred (risk avoidance is a core objective)";
        }
        field(15; Tolerance; Option)
        {
            OptionCaption = ' ,Extremely low,Low,Limited,Expect some,Fully anticipated';
            OptionMembers = " ","Extremely low",Low,Limited,"Expect some","Fully anticipated";
        }
        field(16; Choice; Option)
        {
            OptionCaption = ' ,Always select option with highest return,Fully accept risk but manage impact,Accept if risk is limited & benefits outweigh risks,Will accept only if essential and limited possibility/extent of failure,Only selects lowest risk option';
            OptionMembers = " ","Always select option with highest return","Fully accept risk but manage impact","Accept if risk is limited & benefits outweigh risks","Will accept only if essential and limited possibility/extent of failure","Only selects lowest risk option";
        }
        field(17; "Trade-Off"; Option)
        {
            OptionCaption = ' ,Willing,Willing under certain conditions,Prefer to avoid,With extreme reluctance,Never';
            OptionMembers = " ",Willing,"Willing under certain conditions","Prefer to avoid","With extreme reluctance",Never;
        }
        field(18; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(19; "Actual Rating"; Decimal)
        {
            TableRelation = "Risk Rating Actual Scale"."Actual Rating" where("Risk Rating Scale Type" = field("Risk Rating Scale Type"),
                                                                              "Rating Scale ID" = field("Rating Scale ID"),
                                                                              Code = field(Code),
                                                                              "Rating Score" = field("Rating Score"));
        }
    }

    keys
    {
        key(Key1; "Risk Rating Scale Type", "Rating Scale ID", "Code", "Line No", "Actual Rating")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", "Actual Rating", Description)
        {
        }
    }
}

