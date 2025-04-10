page 50367 "Special AIES List"
{
    Caption = 'AIE List';
    PageType = List;
    SourceTable = "Auth. Inc. Expend. Header";
    UsageCategory = None;
    SourceTableView = where("Batch No." = Const(''), Type = const(Custom), Mobile = const(false));
    Editable = false;
    CardPageId = "Special AIE Card";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Amount to Authorize"; Rec."Amount to Authorize")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount to Authorize field.';
                }
                field("Corporate Strategy"; Rec."Corporate Strategy")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Reporting Period"; Rec."Reporting Period")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Workplan; Rec.Workplan)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Budget Code"; Rec."Budget Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Quarter"; Rec.Quarter)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic, Suite;
                }
                field(AdminUnit; AdminUnit)
                {
                    ApplicationArea = Basic, Suite;
                }
                field(GeoLocation; GeoLocation)
                {
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
         AIELines.Reset();
        AIELines.SetRange("Document No.", Rec."No.");
        if AIELines.FindFirst() then begin
            AdminUnit := AIELines."Global Dimension 2 Code";
            GeoLocation := AIELines."Global Dimension 1 Code";
        end;
    end;

    var
        AdminUnit, GeoLocation : Code[20];
        AIELines: Record "Auth. Inc Expend. Line";
}
