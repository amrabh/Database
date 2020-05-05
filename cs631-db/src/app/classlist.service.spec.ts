import { TestBed } from '@angular/core/testing';

import { ClasslistService } from './classlist.service';

describe('ClasslistService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: ClasslistService = TestBed.get(ClasslistService);
    expect(service).toBeTruthy();
  });
});
