
table 69447 "Emergency Drill Evacuation"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Drill ID"; Code[20])
        {
        }
        field(2; "Evacuation Event ID"; Code[20])
        {
            TableRelation = "Emergency Drill Log"."Evacuation Event ID";
        }
        field(3; "Evacuation Procedure ID"; Integer)
        {
            TableRelation = "Evacuation Event Procedure"."Line No." where("Evacuation Event ID" = field("Evacuation Event ID"));

            trigger OnValidate()
            begin
                EvacuationEventProcedure.Reset;
                EvacuationEventProcedure.SetRange(EvacuationEventProcedure."Evacuation Event ID", "Evacuation Event ID");
                EvacuationEventProcedure.SetRange(EvacuationEventProcedure."Line No.", "Evacuation Procedure ID");
                if EvacuationEventProcedure.FindSet then begin
                    Description := EvacuationEventProcedure.Description;
                end;
            end;
        }
        field(4; Description; Text[2048])
        {
        }
        field(5; "Compliance Status"; Option)
        {
            OptionCaption = ' ,Non-Compliant,Partially Compliant,Substantially Compliant,Fully Compliant,Not Applicable';
            OptionMembers = " ","Non-Compliant","Partially Compliant","Substantially Compliant","Fully Compliant","Not Applicable";
        }
        field(6; "Drill Obeservations"; Text[2048])
        {
        }
        field(7; "No. of Recommended Actions"; Integer)
        {
            CalcFormula = count("Emergency Drill Action Plan" where("Evacuation Event ID" = field("Evacuation Event ID")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Drill ID", "Evacuation Event ID", "Evacuation Procedure ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        EvacuationEventProcedure: Record "Evacuation Event Procedure";
}

