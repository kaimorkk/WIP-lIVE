table 70055 "PAS Core Values"
{
    Caption = 'PAS Core Values';
    DataClassification = ToBeClassified;
    fields
    {
        field(1; "Performance Contract Header"; Code[100])
        {
            Caption = 'Performance Contract Header';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Core Value"; Code[255])
        {
            TableRelation = "Strategy Core Value"."Core Value";
        }
        field(4; Score; Decimal)
        {
            MaxValue = 5;
            MinValue = 1;
            DecimalPlaces = 0 : 0;
        }
        field(5; "Strategic Plan ID"; Code[30])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(6; "Appraisee Comments"; Text[250])
        {
        }
        field(7; "Appraisers Comments"; Text[250])
        {
        }
        field(8; "Behavioural expectation"; Text[250])
        {
        }
        field(9; "Key Performance Indicator"; Text[250])
        {
        }
        field(10; Scale; Text[10])
        {
        }
        field(11; Weight; Decimal)
        {
            trigger OnValidate()
            begin
                if xRec.Weight <> Weight then
                    ValidateWeight();
            end;
        }
        field(12; Target; Decimal)
        {
        }
        field(13; "Self Assessment"; Decimal)
        {
        }
        field(14; "Joint Assessment"; Decimal)
        {
        }
        field(15; "Weighted Score"; Decimal)
        {
        }
        field(16; Description; Text[250])
        {
        }
    }
    keys
    {
        key(PK; "Performance Contract Header", "Strategic Plan ID", "Line No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        Scale := 'Rating';
    end;

    local procedure ValidateWeight()
    begin
        if Score > Weight then begin
            Error('Weight cannot be less than the score');
        end;
    end;
}
