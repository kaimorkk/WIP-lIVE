

page 59125 "Vehicle Inspection Card"
{
    PageType = Card;
    SourceTable = "Vehicle Inspection";
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Inspection No."; Rec."Inspection No.")
                {
                    ApplicationArea = Basic;
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Type"; Rec."Inspection Type")
                {
                    ApplicationArea = Basic;
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                }
                field("Vehicle CC"; Rec."Vehicle CC")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Inspection Details")
            {
                field("Last Inspection Date"; Rec."Last Inspection Date")
                {
                    ApplicationArea = Basic;
                }
                field("Last Inspection No."; Rec."Last Inspection No.")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Status"; Rec."Inspection Status")
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Date"; Rec."Inspection Date")
                {
                    ApplicationArea = Basic;
                }
                field("Has Speed Governor"; Rec."Has Speed Governor")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Inspection Center"; Rec."Inspection Center")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Mark as Passed Inspection")
            {
                ApplicationArea = Basic;
                Image = CheckDuplicates;

                trigger OnAction()
                begin
                    if Dialog.Confirm('Are you sure you want to mark this Inspection as passed?', true) then begin
                        Rec.TestField(Posted, false);
                        Rec."Inspection Status" := Rec."inspection status"::Passed;
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posted On" := CurrentDatetime;
                        Rec.Modify;
                    end;
                end;
            }
            action("Mark as Lost Inspection")
            {
                ApplicationArea = Basic;
                Image = CancelAllLines;

                trigger OnAction()
                begin
                    if Dialog.Confirm('Are you sure you want to mark this Inspection as failed?', true) then begin
                        Rec.TestField(Posted, false);
                        Rec."Inspection Status" := Rec."inspection status"::Failed;
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posted On" := CurrentDatetime;
                        Rec.Modify;
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Mark as Passed Inspection_Promoted"; "Mark as Passed Inspection")
                {
                }
                actionref("Mark as Lost Inspection_Promoted"; "Mark as Lost Inspection")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

