

page 59028 "Fuel Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Fuel Card";
    SourceTableView = where(closed = const(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    LookupPageID = "Fleet Vehicles List";
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Model field.';
                }
                field("Card Type"; Rec."Card Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Card Type field.';
                }
                field(lowerlimit; Rec.lowerlimit)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the lowerlimit field.';
                }
                field("Total Allocated Limit"; Rec."Total Allocated Limit")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    LookupPageID = "Limit Types";
                    ToolTip = 'Specifies the value of the Total Allocated Limit field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Requisition Interval"; Rec."Requisition Interval")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requisition Interval field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Fuel Card No."; Rec."Fuel Card No.")
                {
                    ApplicationArea = Basic;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the Fuel Card No. field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Total Amount Spend"; Rec."Total Amount Spend")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Amount Spend field.';
                }
                field("Total Balance"; Rec."Total Balance")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Balance field.';
                }
                field("Allocated Vehicle Limit"; Rec."Allocated Vehicle Limit")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Allocated Vehicle Limit field.';
                }
                field("Total Amt Spend per Vehicle"; Rec."Total Amt Spend per Vehicle")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Total Amt Spend per Vehicle field.';
                }
                field("Vehicle Balance"; Rec."Vehicle Balance")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the Vehicle Balance field.';
                }
            }
            part(Control1000000015; "Fuel Card Lines")
            {
                SubPageLink = "No." = field(No);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Send Request Approval")
            {
                ApplicationArea = Basic;
                Image = Approval;
                ToolTip = 'Executes the Send Request Approval action.';
                trigger OnAction()
                var
                    CustomApprovalsCodeunit: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    if Rec.Status <> Rec.Status::Open then
                        Error('Status must be open');
                    //ApprovalMgt.SendFuelCardApprovalRequest(Rec)

                    // CustomApprovals
                    VarVariant := Rec;
                    if CustomApprovalsCodeunit.CheckApprovalsWorkflowEnabled(VarVariant) then
                        CustomApprovalsCodeunit.OnSendDocForApproval(VarVariant);
                    // Rec.Status := Rec.Status::Approved;
                    //Rec.Modify;
                    //Message('Document Approved Successfully');
                end;
            }
            action("Cancel  Request Approval")
            {
                ApplicationArea = Basic;
                Image = approval;
                ToolTip = 'Executes the Cancel  Request Approval action.';
                trigger OnAction()
                var
                    CustomApprovalsCodeunit: Codeunit "Custom Approvals Codeunit";
                    VarVariant: Variant;
                begin
                    CustomApprovalsCodeunit.OnCancelDocApprovalRequest(VarVariant);
                    //ApprovalMgt.CancelFuelCardRequest(Rec,TRUE,TRUE);
                end;
            }
            action("Fuel Post")
            {
                ApplicationArea = Basic;
                Caption = 'Post';
                Image = Post;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Approved then
                        Error('Approval Status MUST be Approved');

                    if Rec.Posted = true then
                        Error('This Fuel Card Record is Already Posted %1', Rec.No);
                    //check if amount to be posted is greator than allocated amount.
                    Rec.CalcFields(check, "Total Allocated Limit");
                    CheckLimit := Rec."Total Amount Spend" + Rec.check;
                    if CheckLimit > Rec."Total Allocated Limit" then
                        Error('You are not allowed to post Reciept amount(s) that is greater than amount allocated');
                    //check if lower lower limit has been exceeded.
                    if Rec."Total Balance" < Rec.lowerlimit then
                        Message('Remaining balance is%1,Please reoder,your limit of Ksh. %2,has been passed', Rec."Total Balance", Rec.lowerlimit);
                    //Check if vehicle limit has been exceeded.
                    lowercheck := Rec."Total Amt Spend per Vehicle" + Rec.check;

                    if lowercheck > Rec."Total Allocated Limit" then begin
                        Error('The amount spend for this vehicle is more than allocated amount');
                        /*IF CONFIRM('The amount spend for this vehicle is more than allocated amount,Do you still want to Post?',TRUE)=FALSE THEN
                        EXIT;*/
                    end;
                    //enter data to Detailed ledger entry table
                    FuelCard.Reset;
                    FuelCard.SetRange(FuelCard.No, Rec.No);
                    if FuelCard.Find('-') then begin
                        FuelCardLines.Reset;
                        FuelCardLines.SetRange(FuelCardLines."No.", Rec.No);
                        if FuelCardLines.Find('-') then
                            repeat
                                DetailedFD.Init;
                                DetailedFD.Line := DetailedFD.Line + 1;
                                DetailedFD.No := FuelCardLines."No.";
                                DetailedFD."Reciept No" := FuelCardLines."Reciept No";
                                DetailedFD.Amount := FuelCardLines.Amount;
                                DetailedFD."Date of Filling" := FuelCardLines."Date of Fueling";
                                DetailedFD."Date of posting" := Today;
                                DetailedFD.Driver := FuelCardLines.Driver;
                                DetailedFD."Driver Names" := FuelCardLines."Driver Names";
                                DetailedFD.RegNo := FuelCardLines."Vehicle RegNo";
                                DetailedFD.Make := FuelCardLines."vehicle Make";
                                DetailedFD.Posted := true;
                                if DetailedFD.Amount <> 0 then
                                    DetailedFD.Insert;
                            until FuelCardLines.Next = 0;
                        Rec.Posted := true;
                        Message('Fuel card record posted successfully');
                    end;

                end;
            }
            action("Close Document")
            {
                ApplicationArea = Basic;
                Image = Document;
                ToolTip = 'Executes the Close Document action.';
                trigger OnAction()
                begin

                    FuelCardLines.Reset;
                    FuelCardLines.SetRange(FuelCardLines."No.", Rec.No);
                    if FuelCardLines.Find('-') then begin
                        repeat
                            FuelCardLines.closed := true;
                            FuelCardLines.Modify;
                        until FuelCardLines.Next = 0;
                    end;


                    DetailedFD.Reset;
                    DetailedFD.SetRange(No, Rec.No);
                    if DetailedFD.Find('-') then begin
                        repeat
                            DetailedFD.closed := true;
                            DetailedFD.Modify;
                        until DetailedFD.Next = 0;
                    end;


                    Rec.closed := true;
                    Rec.Modify;

                    Message('Fuel Card Document Closed successfully');
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Send Request Approval_Promoted"; "Send Request Approval")
                {
                }
                actionref("Cancel  Request Approval_Promoted"; "Cancel  Request Approval")
                {
                }
                actionref("Fuel Post_Promoted"; "Fuel Post")
                {
                }
            }
            group(Category_Process)
            {
                actionref("Close Document_Promoted"; "Close Document")
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        Rec.CalcFields("Total Amount Spend");
        Rec."Total Balance" := Rec."Total Allocated Limit" - Rec."Total Amount Spend";
        Rec.CalcFields("Total Amt Spend per Vehicle");
        Rec."Vehicle Balance" := Rec."Allocated Vehicle Limit" - Rec."Total Amt Spend per Vehicle";
        Rec.CalcFields(check);
    end;

    trigger OnOpenPage()
    begin
        /*IF "Total Amount Spend">"Allocated vehicle Limit" THEN BEGIN
        ERROR('Total amount spend can not be more that allocated amount');
        END;*/

    end;

    var
        DetailedFD: Record "Fuel Card Entries";
        FuelCardLines: Record "Vehicle Fuel Card Lines";
        FuelCard: Record "Fuel Card";
        CheckLimit: Decimal;
        LowerLimit: Record "Limit Types";
        lowercheck: Decimal;
        CustomApprovals: codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;
    //ApprovalMgt: Codeunit "Approvals Mgmt.";
}

#pragma implicitwith restore

