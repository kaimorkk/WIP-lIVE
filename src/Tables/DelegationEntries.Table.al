Table 52193987 "Delegation Entries"
{
    DrillDownPageID = "Document Appr Delegation List";
    LookupPageID = "Document Appr Delegation List";

    fields
    {
        field(1;"Entry No";Integer)
        {
        }
        field(2;"Delegation No";Code[20])
        {
            TableRelation = "Document Approval Delegation";
        }
        field(3;"Current Approver ID";Code[20])
        {
            TableRelation = "No. Series";

            
        }
        field(4;"New Approver ID";Code[20])
        {
            TableRelation = "User Setup";

            
        }
        field(5;"Start Date";Date)
        {
        }
        field(6;Duration;DateFormula)
        {

            trigger OnValidate()
            begin
                "End Date":=CalcDate(Duration,"Start Date");
            end;
        }
        field(7;"End Date";Date)
        {
        }
        field(8;"Delegation Limits Approver ID";Code[20])
        {
            TableRelation = "User Setup";

            
        }
        field(9;"No. Series";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(10;Description;Text[250])
        {
        }
        field(11;"Entry Type";Option)
        {
            OptionCaption = 'Delegation,Resumption';
            OptionMembers = Delegation,Resumption;
        }
        field(12;"Approval Code";Code[20])
        {
            //TableRelation = "Approval Code";
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        LoginMgt: Codeunit "User Management";
        Text000: label 'Processing Approval Delegation \From #1#########\ To   #2#########\ Delagated Authority #3#########';
        Text001: label 'There is a current Delegation that is already open, Do u want to replace it?';
        NoSeriesMgt: Codeunit NoSeriesManagement;
        //ApprovalSetup: Record "Approval Setup";


    // procedure Delegate(Rec: Record "Document Approval Delegation")
    // var
    //     UserSetup: Record "User Setup";
    //     ApprovalTemplates: Record "Approval Templates";
    //     AdditionalApprovers: Record "Additional Approvers";
    //     CurrentDelegations: Record "Document Approval Delegation";
    //     Window: Dialog;
    //     ApprovalEntry: Record "Approval Entry";
    // begin

    //     //Check if there is an already open delegation
    //     Window.Open(Text000,Rec."Current Approver ID",Rec."New Approver ID",Rec."Delegation Limits Approver ID");
    //     CurrentDelegations.Reset;
    //     CurrentDelegations.SetRange("Current Approver ID",Rec."Current Approver ID");
    //     CurrentDelegations.SetRange("New Approver ID",Rec."New Approver ID");
    //     CurrentDelegations.SetRange("Delegation Limits Approver ID",Rec."Delegation Limits Approver ID");
    //     CurrentDelegations.SetFilter("Start Date",'>=%1',Rec."Start Date");
    //     CurrentDelegations.SetFilter("End Date",'<=%1',"End Date");
    //     CurrentDelegations.SetFilter("Delegation No",'<>%1',Rec."Delegation No");
    //      if  CurrentDelegations.Find('-') then begin
    //           if Confirm(Text001,false) then begin
    //              repeat
    //               ApprovalTemplates.Reset;
    //               ApprovalTemplates.SetRange(Enabled,true);
    //               if ApprovalTemplates.Find('-') then begin
    //                  repeat
    //                  AdditionalApprovers.Reset;
    //                  AdditionalApprovers.SetRange(AdditionalApprovers."Approval Code",ApprovalTemplates."Approval Code");
    //                  AdditionalApprovers.SetRange(AdditionalApprovers."Approver ID",Rec."New Approver ID");
    //                  //AdditionalApprovers.SETFILTER(AdditionalApprovers."Approval Level",'<>%1',
    //                  //                              AdditionalApprovers."Approval Level"::"Delegated Limits");
    //                  if AdditionalApprovers.Find('-') then begin
    //                     repeat
    //                     CurrentDelegations."New Approver ID":=Rec."New Approver ID";
    //                     CurrentDelegations."Current Approver ID":=Rec."Current Approver ID";
    //                     CurrentDelegations."Start Date":=Rec."Start Date";
    //                     CurrentDelegations.Duration:=Rec.Duration;
    //                     CurrentDelegations."End Date":=Rec."End Date";
    //                     CurrentDelegations.Modify;
    //                     until
    //                     AdditionalApprovers.Next=0;
    //                  end;
    //                  AdditionalApprovers.Reset;
    //                  AdditionalApprovers.SetRange(AdditionalApprovers."Approval Code",ApprovalTemplates."Approval Code");
    //                  AdditionalApprovers.SetRange(AdditionalApprovers."Approver ID",Rec."Delegation Limits Approver ID");
    //                  //AdditionalApprovers.SETRANGE(AdditionalApprovers."Approval Level",
    //                  //                             AdditionalApprovers."Approval Level"::"Delegated Limits");
    //                  if AdditionalApprovers.Find('-') then begin
    //                     repeat
    //                     CurrentDelegations."New Approver ID":=Rec."Delegation Limits Approver ID";
    //                     CurrentDelegations."Current Approver ID":=Rec."Current Approver ID";
    //                     CurrentDelegations."Start Date":=Rec."Start Date";
    //                     CurrentDelegations.Duration:=Rec.Duration;
    //                     CurrentDelegations."End Date":=Rec."End Date";
    //                     CurrentDelegations.Modify;
    //                     until
    //                     AdditionalApprovers.Next=0;
    //                  end;

    //                  until
    //                  ApprovalTemplates.Next=0;
    //               end;
    //              until
    //              CurrentDelegations.Next=0;
    //              end
    //           else
    //           exit;
    //        end else begin
    //            UserSetup.Reset;
    //            UserSetup.SetRange("Approver ID",Rec."Current Approver ID");
    //            if UserSetup.Find('-') then begin
    //               repeat
    //               UserSetup."Approver ID":=Rec."New Approver ID";
    //               UserSetup.Modify;
    //               until
    //               UserSetup.Next=0;
    //            end;
    //            ApprovalTemplates.Reset;
    //            ApprovalTemplates.CalcFields("Additional Approvers");
    //            ApprovalTemplates.SetRange(Enabled,true);
    //            ApprovalTemplates.SetRange("Additional Approvers",true);
    //            if ApprovalTemplates.Find('-') then begin
    //               repeat
    //               //Other than delagated authority
    //               AdditionalApprovers.Reset;
    //               AdditionalApprovers.SetCurrentkey("Approver ID","Approval Code","Approval Type","Document Type","Limit Type");
    //               AdditionalApprovers.SetRange("Approver ID",Rec."Current Approver ID");
    //               AdditionalApprovers.SetRange("Approval Code",ApprovalTemplates."Approval Code");
    //               AdditionalApprovers.SetRange("Approval Type",ApprovalTemplates."Approval Type");
    //               AdditionalApprovers.SetRange("Document Type",ApprovalTemplates."Document Type");
    //               AdditionalApprovers.SetRange("Limit Type",ApprovalTemplates."Limit Type");
    //              // AdditionalApprovers.SETFILTER("Approval Level",'<>%1',AdditionalApprovers."Approval Level"::"Delegated Limits");
    //               if AdditionalApprovers.Find('-') then begin
    //                  AdditionalApprovers.Rename(Rec."New Approver ID",ApprovalTemplates."Approval Code",ApprovalTemplates."Approval Type",
    //                                             ApprovalTemplates."Document Type",ApprovalTemplates."Limit Type");

    //               end;

    //               //Delegated authority
    //               AdditionalApprovers.Reset;
    //               AdditionalApprovers.SetCurrentkey("Approver ID","Approval Code","Approval Type","Document Type","Limit Type");
    //               AdditionalApprovers.SetRange("Approver ID",Rec."Current Approver ID");
    //               AdditionalApprovers.SetRange("Approval Code",ApprovalTemplates."Approval Code");
    //               AdditionalApprovers.SetRange("Approval Type",ApprovalTemplates."Approval Type");
    //               AdditionalApprovers.SetRange("Document Type",ApprovalTemplates."Document Type");
    //               AdditionalApprovers.SetRange("Limit Type",ApprovalTemplates."Limit Type");
    //              // AdditionalApprovers.SETRANGE("Approval Level",AdditionalApprovers."Approval Level"::"Delegated Limits");
    //               if AdditionalApprovers.Find('-') then begin
    //                  AdditionalApprovers.Rename(Rec."Delegation Limits Approver ID",ApprovalTemplates."Approval Code",
    //                  ApprovalTemplates."Approval Type",ApprovalTemplates."Document Type",ApprovalTemplates."Limit Type");

    //               end;

    //               until
    //               ApprovalTemplates.Next=0;
    //            end;
    //            //Modify all open approval entries other than Delagated Authority
    //            ApprovalEntry.Reset;
    //            ApprovalEntry.SetFilter(Status,'%1|%2',ApprovalEntry.Status::Open,ApprovalEntry.Status::Created);
    //            ApprovalEntry.SetRange(ApprovalEntry."Approver ID",Rec."Current Approver ID");
    //            if ApprovalEntry.Find('-') then begin
    //               repeat
    //               ApprovalEntry."Approver ID":=Rec."New Approver ID";
    //               ApprovalEntry.Modify;
    //               until
    //               ApprovalEntry.Next=0;
    //            end;
    //            //Modify all open approval entries for Delagated Authority
    //            ApprovalEntry.Reset;
    //            ApprovalEntry.SetFilter(Status,'%1|%2',ApprovalEntry.Status::Open,ApprovalEntry.Status::Created);
    //            ApprovalEntry.SetRange(ApprovalEntry."Approver ID",Rec."Delegation Limits Approver ID");
    //            if ApprovalEntry.Find('-') then begin
    //               repeat
    //               ApprovalEntry."Approver ID":=Rec."Delegation Limits Approver ID";
    //               ApprovalEntry.Modify;
    //               until
    //               ApprovalEntry.Next=0;
    //            end;

    //            Rec.Status:=Rec.Status::Processed;
    //            Rec.Modify;
    //        Window.Update();
    //        Sleep(2000);
    //        Window.Close();

    //        end;
    // end;
}

