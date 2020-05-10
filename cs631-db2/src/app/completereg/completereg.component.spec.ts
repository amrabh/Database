import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CompleteregComponent } from './completereg.component';

describe('CompleteregComponent', () => {
  let component: CompleteregComponent;
  let fixture: ComponentFixture<CompleteregComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CompleteregComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CompleteregComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
