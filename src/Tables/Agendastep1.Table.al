Table 52193819 "Agenda step1"
{
    Caption = 'Agenda step';

    fields
    {
        field(1;"Activity Code";Code[10])
        {
            Caption = 'Activity Code';
            NotBlank = true;
            TableRelation = Activity;
        }
        field(2;"Step Nos.";Integer)
        {
            Caption = 'Step No.';
            TableRelation = "Activity Step"."Step No.";

            trigger OnValidate()
            begin
                // ActivitySetup.SETFILTER(ActivitySetup."Activity Code",xRec."Activity Code");
                  ActivitySetup.Get("Activity Code","Step Nos.");
                  Description:=ActivitySetup.Description;
                
                
                 /*
                    IF  ("Activity Code"=ActivitySetup."Activity Code")=TRUE THEN
                     BEGIN
                         ActivitySetup.SETFILTER(,xRec."Activity Code");
                         IF ActivitySetup.GET("Step No.") THEN
                           Description:=ActivitySetup.Description;
                
                                                                                 END;
                    */

            end;
        }
        field(3;Type;Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,Meeting,Phone Call';
            OptionMembers = " ",Meeting,"Phone Call";
        }
        field(4;Description;Text[50])
        {
            Caption = 'Description';
        }
        field(5;Priority;Option)
        {
            Caption = 'Priority';
            OptionCaption = 'Low,Normal,High';
            OptionMembers = Low,Normal,High;
        }
        field(6;"Date Formula";DateFormula)
        {
            Caption = 'Date Formula';
        }
    }

    keys
    {
        key(Key1;"Activity Code","Step Nos.")
        {
            Clustered = true;
        }
        key(Key2;"Activity Code",Type)
        {
            Enabled = false;
        }
    }

    fieldgroups
    {
    }

    var
        ActivitySetup: Record "Activity Step";
        Activity: Record Activity;
}

