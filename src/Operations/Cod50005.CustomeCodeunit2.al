namespace ALProjectLIWPA.ALProjectLIWPA;
using System.Automation;




Codeunit 52193489 "Custom Approvals Codeunit2"
{

    trigger OnRun()
    begin
        AddWorkflowEventsToLibrary
    end;

    var
        //changed
        WorkflowManagement: Codeunit "Workflow Management";
        UnsupportedRecordTypeErr: label 'Record type %1 is not supported by this workflow response.', Comment = 'Record type Customer is not supported by this workflow response.';
        NoWorkflowEnabledErr: label 'This record is not supported by related approval workflow.';
        //Test
        //Staff Registration
        RunWorkflowOnsendStaffregistrationForApprovalCode: label 'RUNWORKFLOWONSENDSTAFFREGISTRATIONRFORAPPROVAL';
        RunWorkflowOnCancelstaffRegistrationForApprovalCode: label 'RUNWORKFLOWONCANCELSTAFFREGISTRATIONFORAPPROVAL';
        OnCancelStaffRegistrationApprovalRequestTxt: label 'An Approval of Staff registration is cancelled';
        OnSendStaffRegistrationApprovalRequestTxt: label ' An Approval of Staff registration is requested';
    //Storeheader

    procedure CheckApprovalsWorkflowEnabled(var Variant: Variant): Boolean
    var
        RecRef: RecordRef;
        WorkflowEventHandling: Codeunit "Workflow Event Handling";

        Staffregistration: Record "Wip Header Registration";

        AssetTransIssue: Record "HR Asset Transfer Header";
        HoldingArea: Record "HR Employees";

    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            Database::"Wip Header Registration":
                exit(CheckApprovalsWorkflowEnabledCode(Variant, RunWorkflowOnsendStaffregistrationForApprovalCode));
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;
    end;


    procedure CheckApprovalsWorkflowEnabledCode(var Variant: Variant; CheckApprovalsWorkflowTxt: Text): Boolean
    var
        RecRef: RecordRef;
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
    begin
        begin
            if not WorkflowManagement.CanExecuteWorkflow(Variant, CheckApprovalsWorkflowTxt) then
                Error(NoWorkflowEnabledErr);
            exit(true);
        end;
    end;

    [IntegrationEvent(false, false)]

    procedure OnSendDocForApproval(var Variant: Variant)
    begin
    end;

    [IntegrationEvent(false, false)]

    procedure OnCancelDocApprovalRequest(var Variant: Variant)
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure AddWorkflowEventsToLibrary()
    var
        WorkFlowEventHandling: Codeunit "Workflow Event Handling";
    begin


        //StaffRequaest

        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnsendStaffregistrationForApprovalCode, Database::"Wip Header Registration", OnSendStaffRegistrationApprovalRequestTxt, 0, false);
        WorkFlowEventHandling.AddEventToLibrary(RunWorkflowOnCancelstaffRegistrationForApprovalCode, Database::"Wip Header Registration", OnCancelStaffRegistrationApprovalRequestTxt, 0, false);

    end;

    local procedure RunWorkflowOnSendApprovalRequestCode(): Code[128]
    begin
        exit(UpperCase('RunWorkflowOnSendApprovalRequest'));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Custom Approvals Codeunit2", 'OnSendDocForApproval', '', false, false)]

    procedure RunWorkflowOnSendApprovalRequest(var Variant: Variant)
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            Database::"Wip Header Registration":
                WorkflowManagement.HandleEvent(RunWorkflowOnsendStaffregistrationForApprovalCode, Variant);
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Custom Approvals Codeunit2", 'OnCancelDocApprovalRequest', '', false, false)]

    procedure RunWorkflowOnCancelApprovalRequest(var Variant: Variant)
    var
        RecRef: RecordRef;
    begin
        RecRef.GetTable(Variant);
        case RecRef.Number of
            Database::"Wip Header Registration":
                WorkflowManagement.HandleEvent(RunWorkflowOnCancelstaffRegistrationForApprovalCode, Variant);
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end;
    end;

    //for approvals mgnt


    //Handle responses kkaimor

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnOpendocument', '', false, false)]
    local procedure OnOpendocument(RecRef: RecordRef; var Handled: Boolean)

    var

        StaffREgistration: Record "Wip Header Registration";


    begin
        case RecRef.number of


            Database::"Wip Header Registration":
                begin
                    RecRef.SetTable(StaffREgistration);
                    StaffREgistration.Validate(StaffREgistration."Approval Status", StaffREgistration."Approval Status"::Open);
                    StaffREgistration.Modify;
                    Handled := true;
                end;




        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'onSetStatusToPendingApproval', '', false, false)]
    local procedure OnSetStatusToPendingApproval(RecRef: RecordRef; var Variant: Variant; var IsHandled: Boolean)
    var

        StaffRegistration: Record "Wip Header Registration";


    begin
        case RecRef.number of



        // Database::"Wip Header Registration":
        //     begin
        //         RecRef.SetTable(StaffRegistration);
        //         StaffRegistration.Validate(StaffRegistration."Approval Status", StaffRegistration."Approval Status"::"Pending Approval");
        //         StaffRegistration."Approval Status" := StaffRegistration."Approval Status"::"Pending Approval";
        //         StaffRegistration.Modify(true);
        //         Variant := StaffRegistration;
        //         IsHandled := true;
        //     end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnPopulateApprovalEntryArgument', '', false, false)]
    local procedure OnPopulateApprovalEntryArgument(var RecRef: RecordRef; var ApprovalEntryArgument: Record "Approval Entry"; workflowstepInstance: Record "Workflow Step Instance")
    var

        StaffRegistration: Record "Wip Header Registration";


    begin
        case RecRef.number of
            Database::"Wip Header Registration":
                begin
                    RecRef.SetTable(StaffRegistration);
                    ApprovalEntryArgument."Document No." := StaffRegistration."No.";

                end;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Response Handling", 'OnReleaseDocument', '', false, false)]
    local procedure OnReleaseDocument(RecRef: RecordRef; var Handled: boolean)
    var
        StaffRegistration: Record "Wip Header Registration";

    begin
        case RecRef.Number of

        // Database::"Wip Header Registration":
        //     begin
        //         RecRef.SetTable(StaffRegistration);
        //         StaffRegistration.Validate(StaffRegistration."Approval Status", StaffRegistration."Approval Status"::Approved);
        //         StaffRegistration."Approval Status" := StaffRegistration."Approval Status"::Approved;
        //         StaffRegistration.Modify;
        //         Handled := true;
        //     end;

        end;
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Approvals Mgmt.", 'OnRejectApprovalRequest', '', false, false)]

    local procedure OnRejectApprovalRequest(var ApprovalEntry: Record "Approval Entry")
    var

        StaffRegistration: Record "Wip Header Registration";


    begin
        case ApprovalEntry."Table ID" of

            database::"Wip Header Registration":
                begin
                    if StaffRegistration.Get(ApprovalEntry."Document No.") then begin
                        StaffRegistration.validate(StaffRegistration."Approval Status", StaffRegistration."Approval Status"::Rejected);
                        StaffRegistration."Approval Status" := StaffRegistration."Approval Status"::Rejected;
                        StaffRegistration.modify(true);
                    end;
                end;




        end;
    end;
    //approvals response


    procedure ReOpen(var Variant: Variant)
    var

        RecRef: RecordRef;
        StaffRegistration: Record "Wip Header Registration";


    begin

        RecRef.GetTable(Variant);
        case RecRef.Number of
            Database::"Wip Header Registration":
                begin
                    RecRef.SetTable(StaffRegistration);
                    StaffRegistration.Validate(StaffRegistration."Approval Status", StaffRegistration."Approval Status"::Open);
                    StaffRegistration.Modify;
                    Variant := StaffRegistration;
                end;

            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end

    end;

    procedure SetStatusToPending(var Variant: Variant)
    var
        RecRef: RecordRef;

        StaffREgistration: Record "Wip Header Registration";
    begin

        RecRef.GetTable(Variant);
        case RecRef.Number of



            //Gurantor Substitution
            Database::"Wip Header Registration":
                begin
                    RecRef.SetTable(StaffREgistration);
                    StaffREgistration.Validate(StaffREgistration."Approval Status", StaffREgistration."Approval Status"::"Pending approval");
                    StaffREgistration.Modify;
                    Variant := StaffREgistration;
                end;
            else
                Error(UnsupportedRecordTypeErr, RecRef.Caption);
        end
    end;
}

