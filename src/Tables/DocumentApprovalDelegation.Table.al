Table 52193986 "Document Approval Delegation"
{
    DrillDownPageID = "Document Appr Delegation List";
    LookupPageID = "Document Appr Delegation List";

    fields
    {
        field(1;"Delegation No";Code[20])
        {

            trigger OnValidate()
            begin
                if xRec."Delegation No"<>"Delegation No" then begin
                //    ApprovalSetup.Get;
                   //ApprovalSetup.TestField("Delegation Nos");
                //    NoSeriesMgt.TestManual(ApprovalSetup."Delegation Nos");
                   "No. Series":='';
                end;
            end;
        }
        field(2;"Current Approver ID";Code[30])
        {
            TableRelation = "No. Series";

            
        }
        field(3;"New Approver ID";Code[30])
        {
            TableRelation = "User Setup";

            
        }
        field(4;"Start Date";Date)
        {

            trigger OnValidate()
            begin
                CompInfo.Get;
                if Codefactory.DetermineIfIsNonWorking("Start Date") then
                     Error(Text003);
            end;
        }
        field(5;Duration;DateFormula)
        {

            trigger OnValidate()
            var
            begin
                CompInfo.Get;
                EndDate:="Start Date";
                NoOfDays:=(CalcDate(Duration,"Start Date")-"Start Date");
                //Calculate the end date based on working days
                 repeat
                 if not Codefactory.DetermineIfIsNonWorking(EndDate) then
                        NoOfWorkingDays:=NoOfWorkingDays+1;
                        EndDate:=CalcDate('1D',EndDate);

                 until  NoOfWorkingDays=NoOfDays;
                 "End Date":=EndDate;
                 if not Codefactory.DetermineIfIsNonWorking(EndDate) then
                      Loop:=true
                      else begin
                      Loop:=false;
                      repeat
                      "End Date":=CalcDate('1D',"End Date");
                     if not Codefactory.DetermineIfIsNonWorking(EndDate) then
                      Loop:=true;
                      until Loop=true;
                 end;
            end;
        }
        field(6;"End Date";Date)
        {
        }
        field(7;Status;Option)
        {
            OptionCaption = 'Open,Processed,Expired';
            OptionMembers = Open,Processed,Expired;
        }
        field(8;"Delegation Limits Approver ID";Code[30])
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
    }

    keys
    {
        key(Key1;"Delegation No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        // if "Delegation No"='' then begin
        //     ApprovalSetup.Get;
        //     ApprovalSetup.TestField("Delegation Nos");
        //     NoSeriesMgt.InitSeries(ApprovalSetup."Delegation Nos",xRec."No. Series",0D,"Delegation No","No. Series");
        // end;
    end;

    var
        LoginMgt: Codeunit "User Management";
        Text000: label 'Processing Approval Delegation \From #1#########\ To   #2#########\ Delegated Authority #3#########';
        Text001: label 'There is a current Delegation that is already open, Do u want to replace it?';
        NoSeriesMgt: Codeunit NoSeriesManagement;
        //ApprovalSetup: Record "Approval Setup";
        Text002: label 'Processing Approval Resumption \From #1######### To   #2#########\ Delegated Authority From #3########  to#4#########';
        CalendarMgmt: Codeunit "Calendar Management";
        CompInfo: Record "Company Information";
        NoOfWorkingDays: Integer;
        EndDate: Date;
        NoOfDays: Integer;
        Loop: Boolean;
        Text003: label 'The Date you have entered is not a working day of the calendar';


    // procedure Delegate(Rec: Record "Document Approval Delegation")
    // var
    //     UserSetup: Record "User Setup";
    //     ApprovalTemplates: Record "Approval Templates";
    //     AdditionalApprovers: Record "Additional Approvers";
    //     CurrentDelegations: Record "Document Approval Delegation";
    //     Window: Dialog;
    //     ApprovalEntry: Record "Approval Entry";
    //     DelegationEntries: Record "Delegation Entries";
    //     EntryNo: Integer;
    //     DimensionRec: Record Dimension;
    //     DimensionValueRec: Record "Dimension Value";
    // begin
        
    //     //Check if there is an already open delegation
    //     Window.Open(Text000,Rec."Current Approver ID",Rec."New Approver ID",Rec."Delegation Limits Approver ID");
    //     CurrentDelegations.Reset;
    //     CurrentDelegations.SetRange("Current Approver ID",Rec."Current Approver ID");
    //     CurrentDelegations.SetRange("New Approver ID",Rec."New Approver ID");
    //     CurrentDelegations.SetRange("Delegation Limits Approver ID",Rec."Delegation Limits Approver ID");
    //     CurrentDelegations.SetFilter("Start Date",'>=%1',Rec."Start Date");
    //     CurrentDelegations.SetFilter("End Date",'<=%1',Rec."End Date");
    //     CurrentDelegations.SetFilter("Delegation No",'<>%1',Rec."Delegation No");
    //      if  CurrentDelegations.Find('-') then begin
    //           if Confirm(Text001,false) then begin
    //              repeat
    //               ApprovalTemplates.Reset;
    //               ApprovalTemplates.SetRange(Enabled,true);
    //               if ApprovalTemplates.Find('-') then begin
    //                  repeat
    //                  //Other than Delegated authority
    //                  AdditionalApprovers.Reset;
    //                  AdditionalApprovers.SetRange(AdditionalApprovers."Approval Code",ApprovalTemplates."Approval Code");
    //                  AdditionalApprovers.SetRange(AdditionalApprovers."Approver ID",Rec."New Approver ID");
    //                 // AdditionalApprovers.SETFILTER(AdditionalApprovers."Approval Level",'<>%1',
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
    //                  //Delegated Authority
    //                  AdditionalApprovers.Reset;
    //                  AdditionalApprovers.SetRange(AdditionalApprovers."Approval Code",ApprovalTemplates."Approval Code");
    //                  AdditionalApprovers.SetRange(AdditionalApprovers."Approver ID",Rec."Delegation Limits Approver ID");
    //                 // AdditionalApprovers.SETRANGE(AdditionalApprovers."Approval Level",
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
    //               //Modify Entries
    //               DelegationEntries.Reset;
    //               DelegationEntries.SetRange("Delegation No",CurrentDelegations."Delegation No");
    //               if DelegationEntries.Find('-') then
    //                  repeat
    //                   DelegationEntries."Current Approver ID":=Rec."Current Approver ID";
    //                   DelegationEntries."New Approver ID":=Rec."New Approver ID";
    //                   DelegationEntries."Start Date":=Rec."Start Date";
    //                   DelegationEntries.Duration:=Rec.Duration;
    //                   DelegationEntries."End Date":=Rec."End Date";
    //                   DelegationEntries."Delegation Limits Approver ID":=Rec."Delegation Limits Approver ID";
    //                   DelegationEntries."No. Series":=Rec."No. Series";
    //                   DelegationEntries.Description:=Rec.Description;
    //                   DelegationEntries.Modify;
        
    //                  until
    //                  DelegationEntries.Next=0;
    //              until
    //              CurrentDelegations.Next=0;
    //              //Delete Current Record
    //              Rec.Delete;
    //              end
    //           else
    //           exit;
    //        end else begin
        
    //            UserSetup.Reset;
    //            UserSetup.SetRange("Approver ID",Rec."Current Approver ID");
    //            if UserSetup.Find('-') then begin
    //               repeat
    //               UserSetup."Approver ID":=Rec."New Approver ID";
    //               UserSetup."Reileved Approver":=Rec."Current Approver ID";
    //               UserSetup.Modify;
    //               until
    //               UserSetup.Next=0;
    //            end;
        
    //            UserSetup.Reset;
    //            UserSetup.SetRange(UserSetup."Immediate Supervisor",Rec."Current Approver ID");
    //            if UserSetup.Find('-') then begin
    //               repeat
    //               UserSetup."Immediate Supervisor":=Rec."New Approver ID";
    //               UserSetup."Reileved Approver":=Rec."Current Approver ID";
    //               UserSetup.Modify;
    //               until
    //               UserSetup.Next=0;
    //            end;
    //            UserSetup.Reset;
    //            UserSetup.SetRange(UserSetup.HOD,Rec."Current Approver ID");
    //            if UserSetup.Find('-') then begin
    //               repeat
    //               UserSetup.HOD:=Rec."New Approver ID";
    //               UserSetup."Reileved Approver":=Rec."Current Approver ID";
    //               UserSetup.Modify;
    //               until
    //               UserSetup.Next=0;
    //            end;
        
        
    //         //    ApprovalTemplates.Reset;
    //         //    ApprovalTemplates.CalcFields("Additional Approvers");
    //         //    ApprovalTemplates.SetRange(Enabled,true);
    //         //    ApprovalTemplates.SetRange("Additional Approvers",true);
    //         //    if ApprovalTemplates.Find('-') then begin
    //         //       repeat
    //         //       //Other than delagated authority
    //         //       AdditionalApprovers.Reset;
    //         //       AdditionalApprovers.SetCurrentkey("Approver ID","Approval Code","Approval Type","Document Type","Limit Type");
    //         //       AdditionalApprovers.SetRange("Approver ID",Rec."Current Approver ID");
    //         //       AdditionalApprovers.SetRange("Approval Code",ApprovalTemplates."Approval Code");
    //         //       AdditionalApprovers.SetRange("Approval Type",ApprovalTemplates."Approval Type");
    //         //       AdditionalApprovers.SetRange("Document Type",ApprovalTemplates."Document Type");
    //         //       AdditionalApprovers.SetRange("Limit Type",ApprovalTemplates."Limit Type");
    //         //     //  AdditionalApprovers.SETFILTER("Approval Level",'<>%1',AdditionalApprovers."Approval Level"::"Delegated Limits");
    //         //       if AdditionalApprovers.Find('-') then begin
    //         //          AdditionalApprovers.Rename(Rec."New Approver ID",ApprovalTemplates."Approval Code",ApprovalTemplates."Approval Type",
    //         //                                     ApprovalTemplates."Document Type",ApprovalTemplates."Limit Type",AdditionalApprovers."Sequence No.");
    //         //          AdditionalApprovers."Relieved Approver":=Rec."Current Approver ID";
    //         //       end;
    //              /*
    //               //Delegated authority
    //               AdditionalApprovers.RESET;
    //               AdditionalApprovers.SETCURRENTKEY("Approver ID","Approval Code","Approval Type","Document Type","Limit Type");
    //               AdditionalApprovers.SETRANGE("Approver ID",Rec."Current Approver ID");
    //               AdditionalApprovers.SETRANGE("Approval Code",ApprovalTemplates."Approval Code");
    //               AdditionalApprovers.SETRANGE("Approval Type",ApprovalTemplates."Approval Type");
    //               AdditionalApprovers.SETRANGE("Document Type",ApprovalTemplates."Document Type");
    //               AdditionalApprovers.SETRANGE("Limit Type",ApprovalTemplates."Limit Type");
    //             //  AdditionalApprovers.SETRANGE("Approval Level",AdditionalApprovers."Approval Level"::"Delegated Limits");
    //               IF AdditionalApprovers.FIND('-') THEN BEGIN
    //                  AdditionalApprovers.RENAME(Rec."Delegation Limits Approver ID",ApprovalTemplates."Approval Code",
    //                  ApprovalTemplates."Approval Type",ApprovalTemplates."Document Type",ApprovalTemplates."Limit Type");
        
    //               END;
    //               */
    //             //   until
    //             //   ApprovalTemplates.Next=0;
    //            end;
    //            //Modify all open approval entries other than Delegated Authority
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
    //            //Modify all open approval entries for Delegated Authority
    //            ApprovalEntry.Reset;
    //            ApprovalEntry.SetFilter(Status,'%1|%2',ApprovalEntry.Status::Open,ApprovalEntry.Status::Created);
    //            ApprovalEntry.SetRange(ApprovalEntry."Approver ID",Rec."Current Approver ID");
    //            if ApprovalEntry.Find('-') then begin
    //               repeat
    //               ApprovalEntry."Approver ID":=Rec."Delegation Limits Approver ID";
    //               ApprovalEntry.Modify;
    //               until
    //               ApprovalEntry.Next=0;
    //            end;
    //            /*
    //            //Modify The AIE Holder
    //            DimensionRec.RESET;
    //            DimensionRec.SETRANGE(DimensionRec.AIE,TRUE);
    //            IF DimensionRec.FIND('-') THEN BEGIN
    //               DimensionValueRec.RESET;
    //               DimensionValueRec.SETRANGE(DimensionValueRec."Dimension Code",DimensionRec.Code);
    //               DimensionValueRec.SETRANGE(DimensionValueRec."AIE Holder",Rec."Current Approver ID");
    //               IF DimensionValueRec.FIND('-') THEN BEGIN
    //                  REPEAT
    //                   DimensionValueRec."AIE Holder":=Rec."New Approver ID";
    //                   DimensionValueRec.MODIFY;
    //                  UNTIL
    //                  DimensionValueRec.NEXT=0;
    //               END;
    //             END;
    //             */
    //            //Insert Delegation Entries
    //            if DelegationEntries.Find('+') then
    //               EntryNo:=DelegationEntries."Entry No"
    //               else
    //               EntryNo:=1;
        
    //            DelegationEntries.Init;
    //            DelegationEntries."Entry No":=EntryNo+1;
    //            DelegationEntries."Delegation No":=Rec."Delegation No";
    //            DelegationEntries."Current Approver ID":=Rec."Current Approver ID";
    //            DelegationEntries."New Approver ID":=Rec."New Approver ID";
    //            DelegationEntries."Start Date":=Rec."Start Date";
    //            DelegationEntries.Duration:=Rec.Duration;
    //            DelegationEntries."End Date":=Rec."End Date";
    //            DelegationEntries."Delegation Limits Approver ID":=Rec."Delegation Limits Approver ID";
    //            DelegationEntries."No. Series":=Rec."No. Series";
    //            DelegationEntries.Description:=Rec.Description;
    //            DelegationEntries."Entry Type":=DelegationEntries."entry type"::Delegation;
    //            if not DelegationEntries.Get(DelegationEntries."Entry No") then
    //            DelegationEntries.Insert;
        
        
    //            Rec.Status:=Rec.Status::Processed;
    //            Rec.Modify;
    //        Window.Update();
    //        Sleep(2000);
    //        Window.Close();
        
    //        end;

    // end;


    // procedure Resume(var Rec: Record "Document Approval Delegation")
    // var
    //     UserSetup: Record "User Setup";
    //     //ApprovalTemplates: Record "Approval Templates";
    //     //AdditionalApprovers: Record "Additional Approvers";
    //     CurrentDelegations: Record "Document Approval Delegation";
    //     Window: Dialog;
    //     ApprovalEntry: Record "Approval Entry";
    //     DelegationEntries: Record "Delegation Entries";
    //     EntryNo: Integer;
    //     DimensionRec: Record Dimension;
    //     DimensionValueRec: Record "Dimension Value";
    // begin
    //     Window.Open(Text002,Rec."New Approver ID",Rec."Current Approver ID",Rec."Delegation Limits Approver ID",Rec."Current Approver ID");
    //            UserSetup.Reset;
    //            UserSetup.SetRange("Approver ID",Rec."New Approver ID");
    //            UserSetup.SetRange("Reileved Approver",Rec."Current Approver ID");
    //            if UserSetup.Find('-') then begin
    //               repeat
    //               UserSetup."Approver ID":=Rec."Current Approver ID";
    //               UserSetup.Modify;
    //               until
    //               UserSetup.Next=0;
    //            end;
    //            //Revert to Immediate Supervisor
    //            UserSetup.Reset;
    //            UserSetup.SetRange(UserSetup."Immediate Supervisor",Rec."New Approver ID");
    //            UserSetup.SetRange("Reileved Approver",Rec."Current Approver ID");
    //            if UserSetup.Find('-') then begin
    //               repeat
    //               UserSetup."Immediate Supervisor":=Rec."Current Approver ID";
    //               UserSetup.Modify;
    //               until
    //               UserSetup.Next=0;
    //            end;
    //            //Revert to HOD
    //            UserSetup.Reset;
    //            UserSetup.SetRange(UserSetup.HOD,Rec."New Approver ID");
    //            UserSetup.SetRange("Reileved Approver",Rec."Current Approver ID");
    //            if UserSetup.Find('-') then begin
    //               repeat
    //               UserSetup.HOD:=Rec."Current Approver ID";
    //               UserSetup.Modify;
    //               until
    //               UserSetup.Next=0;
    //            end;
        
    //         //    ApprovalTemplates.Reset;
    //         //    ApprovalTemplates.CalcFields("Additional Approvers");
    //         //    ApprovalTemplates.SetRange(Enabled,true);
    //         //    ApprovalTemplates.SetRange("Additional Approvers",true);
    //         //    if ApprovalTemplates.Find('-') then begin
    //         //       repeat
    //         //       //Other than delagated authority
    //         //       AdditionalApprovers.Reset;
    //         //       AdditionalApprovers.SetCurrentkey("Approver ID","Approval Code","Approval Type","Document Type","Limit Type");
    //         //       AdditionalApprovers.SetRange("Approver ID","New Approver ID");
    //         //       AdditionalApprovers.SetRange("Approval Code",ApprovalTemplates."Approval Code");
    //         //       AdditionalApprovers.SetRange("Approval Type",ApprovalTemplates."Approval Type");
    //         //       AdditionalApprovers.SetRange("Document Type",ApprovalTemplates."Document Type");
    //         //       AdditionalApprovers.SetRange("Limit Type",ApprovalTemplates."Limit Type");
    //         //       //AdditionalApprovers.SETRANGE("Relieved Approver",Rec."Current Approver ID");
    //         //     //  AdditionalApprovers.SETFILTER("Approval Level",'<>%1',AdditionalApprovers."Approval Level"::"Delegated Limits");
    //         //       if AdditionalApprovers.Find('-') then begin
    //         //         AdditionalApprovers."Approver ID":="Current Approver ID";
    //         //         AdditionalApprovers.Modify;
    //                 /*
    //                  AdditionalApprovers.RENAME(Rec."Current Approver ID",ApprovalTemplates."Approval Code",
    //                  ApprovalTemplates."Approval Type",ApprovalTemplates."Document Type",ApprovalTemplates."Limit Type",AdditionalApprovers."Sequence No.");
    //                  */
    //               end;
        
    //              /*
    //               //Delegated authority
    //               AdditionalApprovers.RESET;
    //               AdditionalApprovers.SETCURRENTKEY("Approver ID","Approval Code","Approval Type","Document Type","Limit Type");
    //               AdditionalApprovers.SETRANGE("Approver ID",Rec."New Approver ID");
    //               AdditionalApprovers.SETRANGE("Approval Code",ApprovalTemplates."Approval Code");
    //               AdditionalApprovers.SETRANGE("Approval Type",ApprovalTemplates."Approval Type");
    //               AdditionalApprovers.SETRANGE("Document Type",ApprovalTemplates."Document Type");
    //               AdditionalApprovers.SETRANGE("Limit Type",ApprovalTemplates."Limit Type");
    //             //  AdditionalApprovers.SETRANGE("Approval Level",AdditionalApprovers."Approval Level"::"Delegated Limits");
    //               IF AdditionalApprovers.FIND('-') THEN BEGIN
    //                  AdditionalApprovers.RENAME(Rec."Current Approver ID",ApprovalTemplates."Approval Code",
    //                  ApprovalTemplates."Approval Type",ApprovalTemplates."Document Type",ApprovalTemplates."Limit Type");
        
    //               END;
    //               */
    //             //   until
    //             //   ApprovalTemplates.Next=0;
    //         //    end;
    //            //Modify all open approval entries other than Delagated Authority
    //            ApprovalEntry.Reset;
    //            ApprovalEntry.SetFilter(Status,'%1|%2',ApprovalEntry.Status::Open,ApprovalEntry.Status::Created);
    //            ApprovalEntry.SetRange(ApprovalEntry."Approver ID",Rec."New Approver ID");
    //            if ApprovalEntry.Find('-') then begin
    //               repeat
    //               ApprovalEntry."Approver ID":=Rec."Current Approver ID";
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
    //               ApprovalEntry."Approver ID":=Rec."Current Approver ID";
    //               ApprovalEntry.Modify;
    //               until
    //               ApprovalEntry.Next=0;
    //            end;
               
    //            //Insert Delegation Entries
    //            if DelegationEntries.Find('+') then
    //               EntryNo:=DelegationEntries."Entry No"
    //               else
    //               EntryNo:=1;
        
    //            DelegationEntries.Init;
    //            DelegationEntries."Entry No":=EntryNo+1;
    //            DelegationEntries."Delegation No":=Rec."Delegation No";
    //            DelegationEntries."Current Approver ID":=Rec."Current Approver ID";
    //            DelegationEntries."New Approver ID":=Rec."New Approver ID";
    //            DelegationEntries."Start Date":=Rec."Start Date";
    //            DelegationEntries.Duration:=Rec.Duration;
    //            DelegationEntries."End Date":=Rec."End Date";
    //            DelegationEntries."Delegation Limits Approver ID":=Rec."Delegation Limits Approver ID";
    //            DelegationEntries."No. Series":=Rec."No. Series";
    //            DelegationEntries.Description:=Rec.Description;
    //            DelegationEntries."Entry Type":=DelegationEntries."entry type"::Resumption;
    //            if not DelegationEntries.Get(DelegationEntries."Entry No") then
    //            DelegationEntries.Insert;
        
        
    //            Rec.Status:=Rec.Status::Expired;
    //            Rec.Modify;
    //        Window.Update();
    //        Sleep(2000);
    //        Window.Close();

    // end;
    var
    Codefactory: Codeunit "Code Factory";

}

